import core.stdc.stdio;
import core.stdc.stdlib;
import core.sys.posix.stdio;

enum BUFFER_SIZE = 1024;

extern (C) int main(int argc, char** argv)
{
    FILE* fp;
    char[BUFFER_SIZE] buffer;

    // Open pipe for reading output of 'ls -l' command
    fp = popen("grep 'D-PRO' ./cache.txt", "r");
    if (fp == null)
    {
        perror("popen");
        exit(EXIT_FAILURE);
    }

    // Read and print each line of output from the command
    while (fgets(&buffer[0], BUFFER_SIZE, fp) != null)
    {
        printf("%s", &buffer[0]);
    }

    // Close the pipe
    if (pclose(fp) == -1)
    {
        perror("pclose");
        exit(EXIT_FAILURE);
    }

    return 0;
}
