#include <stdio.h>
#include <sys/ipc.h>
#include <sys/shm.h>

#define memory_segment 1024

int main ()
{ 
    // key for sharing memory

    key_t shm_key = ftok("shm_keyFile", 1);

    // return identifier for same shared memory

    int shm_id = shmget(shm_key, memory_segment , 0666 | IPC_CREAT);
    
    // attach to same memory segment

    char* data = (char*)shmat(shm_id, (void*)0, 0);
    printf("Data written in shared memory: %s\n", data);

    // detach from shared memory
    shmdt(data);
    
    // destroy memory after detaching
    shmctl(shm_id, IPC_RMID, NULL);
    
    return 0;
}
