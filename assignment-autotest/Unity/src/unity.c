#include "unity.h"
#include <stdio.h>

static int failures = 0;

void UnityFail(const char* msg, int line) {
    printf("FAIL: %s at line %d\n", msg, line);
    failures++;
}

void UnityDefaultTestRun(void (*Func)(void), const char* name, int line) {
    printf("Running %s...\n", name);
    Func();
}

void UnityBegin(const char* filename) {
    failures = 0;
    printf("Unity Test: %s\n", filename);
}

int UnityEnd(void) {
    if (failures == 0) {
        printf("ALL TESTS PASSED\n");
    }
    return failures;
}
