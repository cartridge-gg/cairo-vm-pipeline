#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

print_in_blue "Running cairo program..." && \
cd cairo-lang && \
cairo-run \
    --program=../resources/verify_compiled.json \
    --layout=recursive \
    --program_input=../resources/verify_input.json \
    --trace_file=../resources/verify_trace.json \
    --memory_file=../resources/verify_memory.json \
    --print_output && \
cd ..
