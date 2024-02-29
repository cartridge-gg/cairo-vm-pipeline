#!/usr/bin/env python

import json

PROOF_PATH = "resources/main_proof.json"
VERIFY_INPUT_PATH = "resources/verify_input.json"

def main():
    with open(PROOF_PATH, "r") as file:
        proof = json.load(file)

    result = {
        "proof": proof
    }

    with open(VERIFY_INPUT_PATH, "w") as file:
        json.dump(result, file, indent=2)

if __name__ == "__main__":
    main()
