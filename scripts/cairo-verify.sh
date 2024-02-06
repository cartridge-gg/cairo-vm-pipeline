#!/usr/bin/env bash

cd cairo-verifier && \
scarb build && \
cargo run --release -- ./target/dev/cairo_verifier.sierra.json < ../resources/main_proof_parsed.txt
cd ..
