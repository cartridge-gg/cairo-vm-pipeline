#!/usr/bin/env bash

cd sandstorm && \
cargo run -p sandstorm-cli -r -F parallel -- \
    --air-public-input ../resources/main_public_input.json \
    --program ../resources/main_compiled.json \
    verify \
    --proof ../resources/main_proof.bin \
    --required-security-bits 40 && \
cd ..
