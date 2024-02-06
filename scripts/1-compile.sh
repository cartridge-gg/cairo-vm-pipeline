#!/usr/bin/env bash

cairo-compile \
  resources/fibonacci.cairo \
  --output resources/fibonacci_compiled.json \
  --proof_mode
