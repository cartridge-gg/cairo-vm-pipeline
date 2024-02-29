#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

cd cairo-lang && \
print_in_blue "Compiling cairo program..." && \
cairo-compile \
    --cairo_path=./src \
    src/starkware/cairo/cairo_verifier/layouts/all_cairo/cairo_verifier.cairo \
    --output ../resources/cairo_verifier.json \
    --no_debug_info && \
print_in_blue "Running cairo program..." && \
cairo-run \
    --program=../resources/cairo_verifier.json \
    --layout=recursive \
    --program_input=../resources/cairo_verifier_input.json \
    --trace_file=../resources/cairo_verifier_trace.json \
    --memory_file=../resources/cairo_verifier_memory.json \
    --print_output && \
cd ..
