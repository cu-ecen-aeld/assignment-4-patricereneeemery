cmake_minimum_required(VERSION 3.10)
project(assignment-autotest C)

add_subdirectory(Unity)

include_directories(Unity/src)
include_directories(src)
include_directories(test)

file(GLOB TEST_SOURCES
    test/assignment4/*.c
    src/*.c
)

add_executable(assignment-autotest ${TEST_SOURCES})
target_link_libraries(assignment-autotest Unity pthread)
