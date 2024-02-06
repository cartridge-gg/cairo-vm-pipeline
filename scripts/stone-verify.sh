#!/usr/bin/env bash

cd resources && \
./cpu_air_verifier --in_file=main_proof.json && \
echo "Successfully verified example proof." && \
cd ..
