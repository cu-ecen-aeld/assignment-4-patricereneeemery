#!/bin/bash
# Simple test script for Assignment 4 Part 1

PORT=9000

./aesdsocket -p $PORT &
PID=$!

sleep 1

echo "hello world" | nc localhost $PORT > output.txt

kill $PID

grep -q "hello world" output.txt
