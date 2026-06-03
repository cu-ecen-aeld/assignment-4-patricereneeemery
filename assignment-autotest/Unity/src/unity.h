/* Unity real header (trimmed but complete enough for AESD tests) */
#ifndef UNITY_H
#define UNITY_H

void UnityBegin(const char*);
int UnityEnd(void);
void UnityDefaultTestRun(void (*Func)(void), const char*, int);

#define UNITY_BEGIN() UnityBegin(__FILE__)
#define UNITY_END() UnityEnd()
#define RUN_TEST(func) UnityDefaultTestRun(func, #func, __LINE__)
#define TEST_ASSERT_EQUAL(expected, actual) if ((expected) != (actual)) { UnityFail("Values Not Equal", __LINE__); }

void UnityFail(const char*, int);

#endif
