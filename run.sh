#!/usr/bin/env bash

./scripts/build.sh && \
./scripts/compile.sh && \
./scripts/run.sh && \
./scripts/stone-prove.sh && \
./scripts/stone-verify.sh
