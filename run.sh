#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

print_in_blue "Building the prover..." && \
./scripts/build.sh && \

print_in_blue "Compiling the program..." && \
./scripts/compile.sh && \

print_in_blue "Running the program..." && \
./scripts/run.sh && \

print_in_blue "Proving the program..." && \
./scripts/stone-prove.sh && \

print_in_blue "Verifying the proof with Stone Prover..." && \
./scripts/stone-verify.sh

print_in_blue "Parsing the proof..." && \
./scripts/parse.sh

print_in_blue "Verifying the proof with Cairo Verifier..." && \
./scripts/cairo-verify.sh
