#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

print_in_blue "Building the project..." && \
./scripts/build.sh && \

print_in_blue "Compiling the project..." && \
./scripts/compile.sh && \

print_in_blue "Running the project..." && \
./scripts/run.sh && \

print_in_blue "Proving the project..." && \
./scripts/stone-prove.sh && \

print_in_blue "Verifying the project..." && \
./scripts/stone-verify.sh

print_in_blue "Parsing the proof..." && \
./scripts/parse.sh
