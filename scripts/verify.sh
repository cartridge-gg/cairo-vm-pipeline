#!/usr/bin/env bash

cd sandstorm && \
cargo run -p sandstorm-cli -r -F parallel -- \
    --program ../resources/main_compiled.json \
    --air-public-input ../resources/main_public_input.json \
    verify \
    --proof ../resources/main_proof.bin
cd ..
