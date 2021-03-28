#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

/**
 * Compile with -fno-stack-protector -z execstack
 */

int main()
{
    unsigned char shellcodes[] = "\xb0\x01"
                                 "\xb3\x05"
                                 "\xcd\x80";
        
    int (*ret)() = (int (*)())shellcodes;
    (int)(*ret)();
}