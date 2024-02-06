#!/usr/bin/env bash

cairo-run \
  --program=resources/fibonacci_compiled.json \
  --layout=recursive \
  --program_input=resources/fibonacci_input.json \
  --air_public_input=resources/fibonacci_public_input.json \
  --air_private_input=resources/fibonacci_private_input.json \
  --trace_file=resources/fibonacci_trace.json \
  --memory_file=resources/fibonacci_memory.json \
  --print_output \
  --proof_mode
