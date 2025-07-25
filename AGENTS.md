# AGENTS Governance

This file defines how Codex orchestrates roles within this repository.

## Orchestrator Responsibilities
1. Examine each task and determine which role should handle it.
2. Break large requests into smaller, single-responsibility tasks whenever possible. Each task file should note any other tasks it depends on.
3. Log each role switch under `plans/YYYY-MM-DD_<role>.agent.md`.
4. Remove finished plan files and summarize the outcome in `docs/FEATURES.md`.
5. Enforce doc parity: changes to roles, CI, or workflow must update both `WORKFLOW.md` and this file.
6. Maintain CI configuration in `.github/workflows/ci.yml`.
7. The CI pipeline runs `scripts/doc_parity_check.sh` to verify doc parity.

## Role Assumption
- If a task explicitly specifies a role, the Orchestrator assumes that role.
- Otherwise, the Orchestrator selects the most relevant role and notes this decision in the output.
- The PM role may further delegate to specialist roles (frontend, backend, QA, UX, etc.).

## Role Files and Insights
- Each role maintains a file under `roles/<role>.work.md` to capture insights and lessons learned during execution.
- Agents may only edit their own `<role>.work.md` file. Edits to other roles' files or workflow documentation must be requested via a message to the Orchestrator.
- Role switching into the Orchestrator is disallowed. Only tasks that explicitly request the Orchestrator can start it.
- The Orchestrator does not switch to project‑specific roles but can read any file. Its modifications are limited to workflow files and documentation.

## Communication Between Agents
- Role assignments and task outlines are committed to `plans/YYYY-MM-DD_<role>.agent.md`.
- Each of these plan files is a simple text task that can be pasted directly into the Codex interface. Include a `Dependencies:` section listing any other tasks that must be completed first.
- Agents exchange progress updates or questions in `messages/YYYY-MM-DD_<from>_to_<to>.md`.
- Responses may be appended to the same file or placed in a new dated file.
- The Orchestrator reviews these message files to decide on further role switches.
- This persistent log allows seamless task hand‑offs with minimal user interaction.

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
- `/docs/FEATURES.md` for a running list of completed work.

This AGENTS.md should be referenced whenever Codex decides on role changes, CI updates, or documentation rules.
