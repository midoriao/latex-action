#!/bin/bash

COMPILER="latexmk"
ARGS="-file-line-error -halt-on-error -interaction=nonstopmode"

WORKING_DIR="$1"
LATEX_SOURCE="$2"

IFS=' ' read -r -a ARGS <<< "$ARGS"

cd "$WORKING_DIR"

"$COMPILER" "${ARGS[@]}" "$LATEX_SOURCE"
