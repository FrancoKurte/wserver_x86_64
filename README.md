# wsrv

A lightweight web server written in x86_64 assembly using NASM.

## Overview

This project is an experimental server implemented in assembly language for Linux x86_64. It currently focuses on basic command-line argument parsing and is under active development to include socket-based server functionality.

## Requirements

- **NASM**: To assemble the `.s` and `.asm` files.
- **GNU ld**: To link the object files.
- **Linux**: Tested on x86_64 Linux systems.
- **Make**: To use the provided `Makefile`.

## Building

1. Ensure `nasm` and `ld` are installed.
2. Run:

```bash
   make
```

This compiles all source files in src/ and generates the executable in build/wsrv.

## Running

Run the server with a port number (e.g., 8080):

```bash
  ./build/wsrv 8080
```

## Project Structure
src/: Source files (.s, .asm) organized by module (cli, utils, server, etc.).
include/: Assembly macros and constants.
build/: Compiled object files and executable.
tests/: Test scripts (work in progress).

## Status
The project is in early development. Current features include command-line argument parsing for port numbers. Socket server functionality is planned.
