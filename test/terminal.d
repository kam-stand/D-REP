extern(C):

import core.stdc.stdio;
import core.stdc.string;
import core.stdc.stdlib;

import core.sys.posix.unistd;
import core.sys.posix.termios;
import core.sys.posix.dirent;
import core.sys.posix.sys.types;

// Constants (not defined in betterC mode)
enum STDIN_FILENO = 0;

enum MAX_FILES = 1024;
enum MAX_FILENAME = 256;

__gshared char[MAX_FILES][MAX_FILENAME] files;
__gshared int fileCount = 0;

void listFiles() {
    auto dir = opendir(".");
    if (dir is null) return;

    dirent* entry;
    while ((entry = readdir(dir)) !is null) {
        const(char)* name = entry.d_name.ptr;
        if (strcmp(name, ".") == 0 || strcmp(name, "..") == 0)
            continue;

        strncpy(files[fileCount].ptr, name, MAX_FILENAME - 1);
        files[fileCount][MAX_FILENAME - 1] = '\0';
        fileCount++;
        if (fileCount >= MAX_FILES) break;
    }

    closedir(dir);
}

void clearScreen() {
    printf("\033[2J\033[H");
}

void drawMenu(int selected) {
    clearScreen();
    for (int i = 0; i < fileCount; i++) {
        if (i == selected)
            printf("> %s\n", files[i].ptr);
        else
            printf("  %s\n", files[i].ptr);
    }
}

void setRawMode(termios* orig) {
    tcgetattr(STDIN_FILENO, orig);
    termios raw = *orig;
    raw.c_lflag &= ~(ICANON | ECHO);
    tcsetattr(STDIN_FILENO, TCSANOW, &raw);
}

void restoreTerminal(termios* orig) {
    tcsetattr(STDIN_FILENO, TCSANOW, orig);
}

int main() {
    listFiles();
    if (fileCount == 0) {
        puts("No files found.");
        return 0;
    }

    termios origTerm;
    setRawMode(&origTerm);

    int selected = 0;

    while (true) {
        drawMenu(selected);
        char c;
        read(STDIN_FILENO, &c, 1);

        if (c == 27) { // ESC
            char[2] seq;
            read(STDIN_FILENO, seq.ptr, 2);
            if (seq[0] == '[') {
                if (seq[1] == 'A') selected = (selected > 0) ? selected - 1 : selected;       // Up
                if (seq[1] == 'B') selected = (selected < fileCount - 1) ? selected + 1 : selected; // Down
            }
        } else if (c == 'k') {
            selected = (selected > 0) ? selected - 1 : selected;
        } else if (c == 'j') {
            selected = (selected < fileCount - 1) ? selected + 1 : selected;
        } else if (c == '\n') {
            restoreTerminal(&origTerm);
            clearScreen();

            char[512] command;
            snprintf(command.ptr, 512, "cat \"%s\"", files[selected].ptr);
            system(command.ptr);
            break;
        }
    }

    restoreTerminal(&origTerm);
    return 0;
}
