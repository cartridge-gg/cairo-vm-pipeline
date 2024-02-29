#!/usr/bin/env bash

cd cairo-lang && \
cairo-run \
    --program=../resources/cairo_verifier.json \
    --layout=recursive \
    --program_input=../resources/cairo_verifier_input.json \
    --trace_file=../resources/cairo_verifier_trace.json \
    --memory_file=../resources/cairo_verifier_memory.json \
    --print_output && \
cd ..
