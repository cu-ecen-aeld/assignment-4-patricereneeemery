#include "test_runner.h"
#include "unity.h"

int main(void)
{
    UNITY_BEGIN();
    run_threading_tests();
    return UNITY_END();
}
