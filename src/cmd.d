module cmd;
import core.stdc.stdio;
import core.stdc.stdlib;

enum SEARCH
{
    WORD,
    LINE,
}

enum MAX_CMDS = 256;
enum MAX_LINE = 1024;

enum PROMPT = "D-REP > ";

void get_commands(FILE* input, FILE* output)
{
    char[MAX_CMDS] CMD;
    char* LINE = cast(char *)malloc(char.sizeof * MAX_LINE);

    while (1)
    {
        fprintf(output, PROMPT);

        char* result = fgets(LINE, MAX_LINE, input);
        if (result is null)
        {
            break; // EOF or error
        }
    }

    free(LINE);
    
}
