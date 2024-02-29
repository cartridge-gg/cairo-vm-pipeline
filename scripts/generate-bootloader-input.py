#!/usr/bin/env python

import json

COMPILED_PROGRAM_PATH = "resources/verify.json"
PROGRAM_INPUT = "resources/verify_input.json"
SIMPLE_BOOTLOADER_INPUT = "resources/simple_bootloader_input.json"

def main():
    with open(COMPILED_PROGRAM_PATH, "r") as file:
        compiled_program = json.load(file)
    with open(PROGRAM_INPUT, "r") as file:
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

    with open(SIMPLE_BOOTLOADER_INPUT, "w") as file:
        json.dump(result, file, indent=2)

if __name__ == "__main__":
    main()
