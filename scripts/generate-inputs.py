#!/usr/bin/env python

import json

COMPILED_PROGRAM_PATH = "resources/verify_compiled.json"
PROOF_PATH = "resources/main_proof.json"

MAIN_INPUT_PATH = "resources/main_input.json"
VERIFY_INPUT_PATH = "resources/verify_input.json"

def main_input():
    result = {
        "fibonacci_claim_index": 10,
    }
    with open(MAIN_INPUT_PATH, "w") as file:
        json.dump(result, file, indent=2)

def verify_input():
    with open(PROOF_PATH, "r") as file:
        proof = json.load(file)
    result = {
        "proof": proof
    }
    with open(VERIFY_INPUT_PATH, "w") as file:
        json.dump(result, file, indent=2)

def main():
    main_input()
    verify_input()


if __name__ == "__main__":
    main()
