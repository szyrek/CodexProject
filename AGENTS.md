# AGENTS Governance

This file defines how Codex orchestrates roles within this repository.

## Orchestrator Responsibilities
1. Examine each task and determine which role should handle it.
2. Log each role switch under `plans/YYYY-MM-DD_<role>.agent.md`.
3. Enforce doc parity: changes to roles, CI, or workflow must update both `README.md` and this file.
4. Maintain CI configuration in `.github/workflows/ci.yml`.

## Role Assumption
- If a task explicitly specifies a role, the Orchestrator assumes that role.
- Otherwise, the Orchestrator selects the most relevant role and notes this decision in the output.
- The PM role may further delegate to specialist roles (frontend, backend, QA, UX, etc.).

## Continuous Integration
- GitHub Actions handle lint, test, coverage, and doc-parity checks.
- Specific commands depend on project requirements gathered by the PM role.
- Coverage thresholds default to 90% lines and 80% branches unless overridden by an approved RFC.

## Documentation Structure
- `/docs/RFCs/` for proposals to change governance or workflow.
- `/docs/ADRs/` for decisions about workflow policies.
- `/docs/QA/` for bug reports and test strategies.
- `/docs/SECURITY/` for threat models and mitigations.
- `GLOSSARY.md` for terminology.

This AGENTS.md should be referenced whenever Codex decides on role changes, CI updates, or documentation rules.
