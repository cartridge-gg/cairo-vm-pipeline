#!/usr/bin/env bash

cd cairo-lang && \
source .venv/bin/activate && \
pip install --upgrade pip && \
pip install -r requirements.txt && \
python src/main.py -l starknet_with_keccak < ../resources/main_proof.json > ../resources/main_proof_parsed.txt && \
deactivate && \
cd ..