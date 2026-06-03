cmake_minimum_required(VERSION 3.10)

project(Unity C)

add_library(Unity STATIC
    src/unity.c
)

target_include_directories(Unity PUBLIC src)
