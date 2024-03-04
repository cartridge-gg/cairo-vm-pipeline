#!/usr/bin/env bash

print_in_blue() {
    echo -e "\033[1;34m$1\033[0m"
}

source .venv/bin/activate && \
print_in_blue "Compiling main program..." && \
cairo-compile \
  --proof_mode \
  --cairo_path cairo-lang/src \
  --output resources/main_compiled.json \
  resources/main.cairo && \
deactivate
