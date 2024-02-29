#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

print_in_blue "Creating python virtual environment..." && \
time ./scripts/venv.sh && \

print_in_blue "Compiling programs..." && \
time ./scripts/compile.sh && \

print_in_blue "Running the program..." && \
time ./scripts/run.sh && \

print_in_blue "Proving the program..." && \
time ./scripts/prove.sh && \

print_in_blue "Verifying the proof..." && \
time ./scripts/verify.sh && \

print_in_blue "Parsing the proof..." && \
time ./scripts/parse.sh && \

print_in_blue "Generate inputs..." && \
time ./scripts/generate-inputs.py

# print_in_blue "Verifying the proof with Cairo Verifier..." && \
# time ./scripts/cairo-verify.sh
