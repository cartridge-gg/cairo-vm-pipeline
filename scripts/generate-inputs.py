#!/usr/bin/env python

import json

COMPILED_PROGRAM_PATH = "resources/verify_compiled.json"
PROOF_PATH = "resources/main_proof.json"

MAIN_INPUT_PATH = "resources/main_input.json"
SIMPLE_BOOTLOADER_INPUT_PATH = "resources/simple_bootloader_input.json"
VERIFY_INPUT_PATH = "resources/verify_input.json"

def main_input():
    result = {
        "fibonacci_claim_index": 10,
    }
    with open(MAIN_INPUT_PATH, "w") as file:
        json.dump(result, file, indent=2)

def simple_bootloader_input():
    with open(COMPILED_PROGRAM_PATH, "r") as file:
        compiled_program = json.load(file)
    with open(PROOF_PATH, "r") as file:
        program_input = json.load(file)

    task = {
        "type": "RunProgramTask",
        "program": compiled_program,
        "program_input": program_input,
        "use_poseidon": False,
    }
    result = {
        "tasks": [task],
        "single_page": True
    }

    with open(SIMPLE_BOOTLOADER_INPUT_PATH, "w") as file:
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
    simple_bootloader_input()
    verify_input()


if __name__ == "__main__":
    main()
