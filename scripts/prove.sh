#!/usr/bin/env bash

cd sandstorm && \
cargo run -p sandstorm-cli -r -F parallel -- \
    --air-public-input ../resources/main_public_input.json \
    --program ../resources/main_compiled.json \
    prove \
    --air-private-input ../resources/main_private_input.json \
    --fri-folding-factor 8 \
    --fri-max-remainder-coeffs 64 \
    --lde-blowup-factor 8 \
    --num-queries 21 \
    --output ../resources/main_proof.bin \
    --proof-of-work-bits 30 && \
cd ..
