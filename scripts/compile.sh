#!/usr/bin/env bash

source .venv/bin/activate && \
pip install --upgrade pip && \
pip install -r requirements.txt && \
cairo-compile \
  resources/main.cairo \
  --output resources/main_compiled.json \
  --proof_mode && \
deactivate && \
