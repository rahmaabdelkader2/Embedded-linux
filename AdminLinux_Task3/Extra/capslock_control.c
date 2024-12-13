#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    // Check if an argument is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <0|1>\n", argv[0]);
        return 1;
    }

    // Open the brightness file
    int fd = open("/sys/class/leds/input3::capslock/brightness", O_RDWR);
    if (fd < 0) {
        perror("Failed to open capslock brightness file");
        return 1;
    }

    // Write the argument to the file
    if (dprintf(fd, "%s\n", argv[1]) < 0) {
        perror("Failed to write to capslock brightness file");
        close(fd);
        return 1;
    }

    // Close the file
    close(fd);
    return 0;
}

