#!/usr/bin/env bash

source .venv/bin/activate && \
CAIRO_PATH=bootloader && \
cairo-compile --output resources/simple_bootloader.json bootloader/simple_bootloader.cairo && \
cairo-run \
    --program resources/simple_bootloader.json \
    --program_input resources/simple_bootloader_input.json \
    --layout starknet \
    --print_output &&
cd .. && \
deactivate
