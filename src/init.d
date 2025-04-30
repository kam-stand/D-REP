module init;


import core.stdc.stdio;
import core.stdc.stdlib;
import core.sys.posix.stdio;


int init_cache(void)
{
    int status = system("find ~/ -path '*/.git' -prune -o -print > ./cache.txt");
    return status;
}