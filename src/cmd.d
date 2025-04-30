module cmd;
import core.stdc.stdio;

enum SEARCH
{
    WORD,
    LINE,
}

enum MAX_CMDS = 1024;
enum MAX_LINE = 4096;

enum PROMPT = "D-REP >";


void get_commands()
{
    char[MAX_CMDS] CMD;
    char[MAX_LINE] line;
    while(1)
    {
    }
}