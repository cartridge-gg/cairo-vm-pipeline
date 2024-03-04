#!/usr/bin/env bash
print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

source .venv/bin/activate && \
print_in_blue "Compiling verify program..." && \
cairo-compile \
  --cairo_path ./cairo-lang/src \
  resources/verify.cairo \
  --output resources/verify_compiled.json \
  --proof_mode && \
print_in_blue "Running verify program..." && \
cairo-run \
    --program resources/verify_compiled.json \
    --layout recursive \
    --program_input resources/verify_input.json \
    --trace_file resources/verify_trace.json \
    --memory_file resources/verify_memory.json \
    --print_output && \
deactivate
