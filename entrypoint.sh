#!/bin/bash

COMPILER="latexmk"
ARGS="-pdf -file-line-error -halt-on-error -interaction=nonstopmode"
LATEX_DIFF="latexdiff-vc"

WORKING_DIR="$1"
LATEX_SOURCE="$2"
DIFF_FROM="$3"

IFS=' ' read -r -a ARGS <<< "$ARGS"

cd "$WORKING_DIR"

if [ -n "$DIFF_FROM" ]; then
    DIFF_FROM=`git rev-parse "$DIFF_FROM"`
    DIFF_TO=`git rev-parse HEAD`
    DIFF_DOC_PATH="${LATEX_SOURCE%%.*}-diff${DIFF_FROM}.tex"
    "$LATEX_DIFF" --git --force -r "$DIFF_FROM" "$LATEX_SOURCE"
    "$COMPILER" "${ARGS[@]}" "$DIFF_DOC_PATH"
    PDF_PATH="${LATEX_SOURCE%%.*}-diff.pdf"
    mv "${DIFF_DOC_PATH%%.*}.pdf" "$PDF_PATH"
else
    "$COMPILER" "${ARGS[@]}" "$LATEX_SOURCE"
    PDF_PATH="${LATEX_SOURCE%%.*}.pdf"
fi

