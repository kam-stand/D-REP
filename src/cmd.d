module cmd;
import core.stdc.stdio;
import core.stdc.stdlib;
import core.stdc.string;

enum SEARCH
{
    WORD,
    LINE,
    FILE, 
    DIRECTORY
}

enum COMMANDS
{
    _LS_ = "ls",
    _CD_ = "cd",
    _CAT_ = "cat",
    _HELP_ = "help",
    _LESS_ = "less",
    _FIND_ = "find",
    _GREP_ = "grep"
}




enum MAX_CMDS = 256;
enum MAX_LINE = 1024;

enum PROMPT = "D-REP > ";

static immutable char[] helpText =
    "D-REP HELP:\n" ~
    "-----------\n" ~
    "[USAGE]\n" ~
    "  [QUERY] - search input (e.g., a word or pattern match)\n" ~
    "  [COMMANDS] - operations to execute based on query\n\n" ~
    "[COMMANDS]\n" ~
    "  ls   - list matches or directory contents based on query\n" ~
    "  cd   - change directory to a match\n" ~
    "  cat  - view contents of a matching file\n" ~
    "[FILE_PATH]\n" ~
    "  Must be a valid file path into cache\n " ~
    "[NOTE]\n" ~
    "  Queries must be valid. Output depends on context.\n";

void get_commands(FILE* input, FILE* output)
{

    char[MAX_LINE] LINE;
    while (1)
    {
        fprintf(output, PROMPT);

        char* result = fgets(LINE.ptr, MAX_LINE, input);
        if (result is null || *result == EOF)
            break;
        tokenize_commands(LINE.ptr);
    }

}

// TODO: get the line and tokenize into <query> <commands> <output> 
void tokenize_commands(char* LINE)
{
    for (char* token = strtok(LINE, " \n\t"); token != null; token = strtok(null, " \n\t"))
    {
        if (strcmp(token, cast(char*)COMMANDS._HELP_) == 0)
        {
            printf("%.*s\n", cast(int) helpText.length, helpText.ptr);
        }
        else if (strcmp(token, cast(char*)COMMANDS._LS_) == 0)
        {
            printf("Listing...\n");
        }
        else if (strcmp(token, cast(char*)COMMANDS._CD_) == 0)
        {
            printf("Changing directory...\n");
        }
        else if (strcmp(token, cast(char*)COMMANDS._CAT_) == 0)
        {
            printf("Viewing file...\n");
        }
        else
        {
            printf("Unknown command: %s\n", token);
        }
    }
    return;
}
