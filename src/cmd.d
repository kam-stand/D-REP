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
    _GREP_ = "grep",
    _SPACE_ = " "
}

static TOKEN[MAX_CMDS] tokens = {null};
static size_t token_count = 0;

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
        print_tokens();
        eval_commands();
    }

}

struct TOKEN
{
    char* command;

}

char* trim(char* str)
{
    if (str is null) return str;

    while (*str == ' ' || *str == '\t' || *str == '\n') str++;

    char* end = str + strlen(str) - 1;

    while (end > str && (*end == ' ' || *end == '\t' || *end == '\n'))
    {
        *end = '\0';
        end--;
    }

    return str;
}


// TODO: get the line and tokenize into <query> <commands> <output> 
void tokenize_commands(char* LINE)
{
    token_count = 0; // reset global index
    char* token = strtok(LINE, " ");
    while (token !is null && token_count < MAX_CMDS)
    {
        tokens[token_count++].command = trim(token);
        token = strtok(null, " ");
    }
}

void print_tokens()
{
    for (size_t i = 0; i < token_count; i++)
    {
        if (tokens[i].command !is null)
            printf("Token %d: %s\n", cast(int) i, tokens[i].command);
    }
}

// TODO: evaluate the commands and put them into a pipeline
void eval_commands()
{

    for (size_t i = 0; i < token_count; i++)
    {
        char* cmd = tokens[i].command;

        if (strcmp(cmd, cast(char *)COMMANDS._HELP_) == 0)
        {
            printf("%s\n", helpText.ptr);
        }
        else if (strcmp(cmd, cast(char *)COMMANDS._CD_) == 0)
        {
            printf("cd command called (implement logic)\n");
        }
        else if (strcmp(cmd, cast(char *)COMMANDS._LS_) == 0)
        {
            printf("ls command called (implement logic)\n");
        }
        else if (strcmp(cmd, cast(char *)COMMANDS._CAT_) == 0)
        {
            printf("cat command called (implement logic)\n");
        }
        else if (strcmp(cmd, cast(char *)COMMANDS._SPACE_) == 0)
        {

        }
        else
        {
          printf("unknown command [%s]\n", cmd);   
        }
    }

    return;
}

