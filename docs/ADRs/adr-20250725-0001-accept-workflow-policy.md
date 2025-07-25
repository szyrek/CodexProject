# ADR-20250725-0001 Accept Workflow Policy

## Context
The project requires a defined governance structure for multi-agent coordination.

## Decision
Adopt the policies described in `RFC-0001 Initialize Workflow` and implement the dual-doc and CI rules.

## Consequences
- Contributors must update both `README.md` and `AGENTS.md` when modifying governance or CI.
- CI will enforce lint, test, coverage, and doc parity once project tooling is specified.
