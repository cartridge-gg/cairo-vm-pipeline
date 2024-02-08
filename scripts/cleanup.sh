#!/usr/bin/env bash

shopt -s extglob

print_in_yellow() {
    echo -e "\033[1;33m$1\033[0m"
}

print_in_yellow "Cleaning up resources..."
rm -rf resources/!(main.cairo|cpu_air_params.json|cpu_air_prover_config.json)

print_in_yellow "Cleaning submodules..."
git submodule deinit -f .
git submodule update --init
