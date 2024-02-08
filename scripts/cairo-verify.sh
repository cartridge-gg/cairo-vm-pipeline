#!/usr/bin/env bash

cd cairo-verifier-runner && \
cargo run -- ../cairo-verifier/target/dev/cairo_verifier.sierra.json < ../resources/main_proof.json && \
cd ..
