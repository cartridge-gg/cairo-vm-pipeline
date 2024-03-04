#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

source .venv/bin/activate && \
print_in_blue "Compiling cairo verifier program..." && \
PYTHONPATH="${PYTHONPATH}:cairo-lang/src" cairo-compile \
  --proof_mode \
  --cairo_path cairo-lang/src \
  --output resources/cairo_verifier_compiled.json \
  cairo-lang/src/starkware/cairo/cairo_verifier/layouts/recursive/cairo_verifier.cairo && \
print_in_blue "Running cairo verifier program..." && \
PYTHONPATH="${PYTHONPATH}:cairo-lang/src" cairo-run \
  --program resources/cairo_verifier_compiled.json \
  --layout recursive \
  --program_input resources/cairo_verifier_input.json \
  --air_public_input resources/main_public_input.json \
  --air_private_input resources/main_private_input.json \
  --trace_file resources/main_trace.bin \
  --memory_file resources/main_memory.bin \
  --print_output \
  --proof_mode && \
deactivate
