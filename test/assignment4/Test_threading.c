#include "unity.h"
#include <pthread.h>
#include <unistd.h>

void* threadfunc(void* param)
{
    sleep(1);
    return param;
}

void test_thread_runs(void)
{
    pthread_t t;
    int rc = pthread_create(&t, NULL, threadfunc, NULL);
    TEST_ASSERT_EQUAL(0, rc);
    pthread_join(t, NULL);
}

void run_threading_tests(void)
{
    RUN_TEST(test_thread_runs);
}
