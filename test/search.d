extern(C):

import core.stdc.stdio;
import core.stdc.string;

enum MAX_LINE = 1024;  // Maximum length of a line

int main()
{
    FILE* file = fopen("cache.txt", "r");
    if (file is null)
    {
        puts("Failed to open file.");
        return 1;
    }

    

    // Buffer for reading each line
    char[MAX_LINE] line;

    // Read each line from the file
    while (fgets(line.ptr, MAX_LINE, file))
    {
        // Remove newline if it exists
        auto newline = strchr(line.ptr, '\n');
        if (newline !is null) *newline = 0;

        // Search for the substring "D_"
        if (strstr(line.ptr, "D-PRO") !is null)
        {
            // Line contains "D_", print it
            puts(line.ptr);
        }
    }

    fclose(file);

    return 0;
}
