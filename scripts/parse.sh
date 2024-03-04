#!/usr/bin/env bash

cd header_chain_parser && \
cargo run --release \
    ../resources/main_proof.bin \
    ../resources/main_public_input.json \
    ../resources/main_compiled.json \
    ../resources/main_proof.json \
    proof && \
cd ..
