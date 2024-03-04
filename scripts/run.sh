#!/usr/bin/env bash

source .venv/bin/activate && \
cd resources && \
cairo-run \
    --program resources/main_compiled.json \
    --layout resources/recursive \
    --program_input resources/main_input.json \
    --air_public_input resources/main_public_input.json \
    --air_private_input resources/main_private_input.json \
    --trace_file resources/main_trace.bin \
    --memory_file resources/main_memory.bin \
    --print_output \
    --proof_mode && \
cd .. && \
deactivate
