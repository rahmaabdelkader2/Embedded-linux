#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define memory_segment 1024

int main ()
{
    /// generate key

    key_t shm_key = ftok("shm_keyFile", 1);
    // return unique identifier for shared memory

    int shm_id = shmget(shm_key, memory_segment, 0666 | IPC_CREAT); 
    // get attached to shared memory

    char* data = (char*)shmat(shm_id, (void*)0, 0);
    printf("Enter data to be saved in shared memory: ");
    fgets(data, memory_segment, stdin);
    printf("Data saved in memory: %s\n", data);

    // detached from shared memory 

    shmdt(data);
    return 0;
}
