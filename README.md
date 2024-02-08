# Project Title

Cairo0 -> cairo-vm -> stone-prover -> Cairo1 Verifier pipeline

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to run the project:

- Git
- asdf

### Installation

A step by step series of examples that tell you how to get a development environment running:

1. Clone the repository and navigate into the directory:

```bash
git clone <repository-url>
cd <repository-name>
```

2. Clone the repository and navigate into the directory:

```bash
git submodule update --init --recursive
```

3. Create a virtual environment:

```bash
python -m venv .venv
```

4. Install some dependencies:

```bash
# Podman to manage containers in scripts:
apt install podman

# Pulls the image required by stone-prover:
podman pull docker.io/ciimage/python:3.9
```

5. Run the script:

```bash
./run.sh
```

A cleanup script is available in `./scripts` to teardown generated files and reinitialize submodules.
