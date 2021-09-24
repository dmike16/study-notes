#include <stdio.h>

int main(void) {
    char *happy[2];

    happy[0] = "/bin/sh";
    happy[1] = NULL;

    return execve(happy[0], happy, NULL);
}