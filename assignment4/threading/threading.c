#include "threading.h"
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

#define DEBUG_LOG(msg,...)
//#define DEBUG_LOG(msg,...) printf("threading: " msg "\n" , ##__VA_ARGS__)

void* threadfunc(void* thread_param)
{
    struct thread_data* thread_func_args = (struct thread_data *) thread_param;

    if (!thread_func_args) {
        return NULL;
    }

    thread_func_args->thread_complete_success = false;

    // Validate inputs
    if (!thread_func_args->mutex ||
        thread_func_args->wait_to_obtain_ms < 0 ||
        thread_func_args->wait_to_release_ms < 0) {

        free(thread_func_args);
        return NULL;
    }

    // Sleep before attempting to obtain the mutex
    usleep(thread_func_args->wait_to_obtain_ms * 1000);

    // Attempt to lock the mutex
    if (pthread_mutex_lock(thread_func_args->mutex) != 0) {
        free(thread_func_args);
        return NULL;
    }

    // Hold the mutex for the requested time
    usleep(thread_func_args->wait_to_release_ms * 1000);

    // Unlock the mutex
    if (pthread_mutex_unlock(thread_func_args->mutex) != 0) {
        free(thread_func_args);
        return NULL;
    }

    // Success
    thread_func_args->thread_complete_success = true;

    free(thread_func_args);
    return NULL;
}

bool start_thread_obtaining_mutex(pthread_t *thread, pthread_mutex_t *mutex,
                                  int wait_to_obtain_ms, int wait_to_release_ms)
{
    struct thread_data *data = malloc(sizeof(struct thread_data));
    if (data == NULL) {
        return false;
    }

    data->mutex = mutex;
    data->wait_to_obtain_ms = wait_to_obtain_ms;
    data->wait_to_release_ms = wait_to_release_ms;
    data->thread_complete_success = false;

    int rc = pthread_create(thread, NULL, threadfunc, data);
    if (rc != 0) {
        free(data);
        return false;
    }

    return true;
}

