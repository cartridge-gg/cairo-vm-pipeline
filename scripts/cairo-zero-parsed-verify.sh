#!/usr/bin/env bash

cd cairo-lang && \
cairo-run \
    --program=../resources/verify_compiled.json \
    --layout=recursive \
    --program_input=../resources/verify_input.json \
    --trace_file=../resources/verify_trace.json \
    --memory_file=../resources/verify_memory.json \
    --print_output && \
cd ..
