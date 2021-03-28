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
    unsigned char shellcodes[] = "\xb8\x01\x00\x00\x00"
                                 "\xbb\x05\x00\x00\x00"
                                 "\xcd\x80";
        
    int (*ret)() = (int (*)())shellcodes;
    (int)(*ret)();
}