# latex-action


## Usage

See [action.yml](action.yml)

### Compile a LaTeX document
```yaml
steps:
- uses: actions/checkout@v2

- uses: midoriao/latex-action@main
  with:
    working-dir: test
    latex-source: note.tex

- uses: actions/upload-artifact@v2
  with:
    name: compiled_documents
    path: test/note.pdf
```

### LaTeX-diff
```yaml
steps:
- uses: actions/checkout@v2
  with:
    fetch-depth: 0  # to fetch the history

- uses: midoriao/latex-action@main
  with:
    working-dir: test
    latex-source: note.tex
    diff-from: HEAD^  # or c48ce2...

- uses: actions/upload-artifact@v2
  with:
    name: compiled_documents
    path: test/note-diff.pdf
```

