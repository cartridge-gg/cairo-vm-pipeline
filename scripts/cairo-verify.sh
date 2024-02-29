#!/usr/bin/env bash

cd cairo-verifier && \
scarb build && \
cd .. && \
cd runner && \
cargo run --release -- ../cairo-verifier/target/dev/cairo_verifier.sierra.json < ../resources/main_proof.json
cd ..
