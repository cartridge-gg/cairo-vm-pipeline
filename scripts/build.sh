#!/usr/bin/env bash

ENGINE=podman

$ENGINE build --tag prover stone-prover && \
container_id=$($ENGINE create prover) && \
$ENGINE cp ${container_id}:/bin/cpu_air_prover ./resources && \
$ENGINE cp ${container_id}:/bin/cpu_air_verifier ./resources
