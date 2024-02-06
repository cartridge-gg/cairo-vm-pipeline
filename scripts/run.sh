#!/usr/bin/env bash

cd cairo-vm && \
cargo build --release -p cairo-vm-cli && \
cargo run --release -p cairo-vm-cli -- \
  ../resources/main_compiled.json \
  --layout starknet_with_keccak \
  --print_output \
  --trace_file ../resources/main_trace.bin \
  --memory_file ../resources/main_memory.bin \
  --air_public_input ../resources/main_public_input.json \
  --air_private_input ../resources/main_private_input.json \
  --proof_mode && \
cd ..
