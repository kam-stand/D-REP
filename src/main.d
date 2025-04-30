import core.stdc.stdio;
import cmd;

extern(C) int  main(int argc, char **argv)
{
    cmd.get_commands(stdin, stdout);

    return 0;
}
