#include <stdio.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>

#define SHARED_FILE "/tmp/shared_buffer"
#define BUFFER_SIZE 1024

int main() {
    int fd = open(SHARED_FILE, O_RDWR);
    if (fd == -1) {
        perror("Failed to open shared file");
        return 1;
    }

    char *shared_mem = mmap(NULL, BUFFER_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
    if (shared_mem == MAP_FAILED) {
        perror("Failed to map shared memory");
        close(fd);
        return 1;
    }

    printf("Message from shared memory: %s\n", shared_mem);

    munmap(shared_mem, BUFFER_SIZE);
    close(fd);
    return 0;
}

