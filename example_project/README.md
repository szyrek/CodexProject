# Example Test Project

This small Python package provides a minimal codebase for exercising Codex.
It implements a simple calculator with a command-line interface and includes
example tasks under `tasks/` that Codex can attempt to automate.

## Usage

Run the CLI directly:

```bash
python -m example_project.cli add 2 3
```

## Tests

Execute unit and end-to-end tests with:

```bash
pytest --cov=example_project
```
