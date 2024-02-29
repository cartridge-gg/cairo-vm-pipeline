#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

cd cairo-lang && \
print_in_blue "Compiling cairo program..." && \
cairo-compile \
    --cairo_path=./src \
    ../resources/verify.cairo \
    --output ../resources/verify.json \
    --no_debug_info && \
print_in_blue "Running cairo program..." && \
cairo-run \
    --program=../resources/verify.json \
    --layout=recursive \
    --program_input=../resources/verify_input.json \
    --trace_file=../resources/verify_trace.json \
    --memory_file=../resources/verify_memory.json \
    --print_output && \
cd ..
