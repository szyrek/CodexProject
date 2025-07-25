# AGENTS Governance

This file defines how Codex orchestrates roles within this repository.

## Orchestrator Responsibilities
1. Examine each task and determine which role should handle it.
2. Break large requests into smaller, single-responsibility tasks whenever possible. Each task file should note any other tasks it depends on.
3. Log each new task under `work/planned/YYYY-MM-DD_<role>.agent.md`.
4. Move a task to `work/in_progress/` when a role begins work. If a task becomes blocked on other tasks, list those blockers in the file, create the blocker files in `work/planned/`, and move the parent task to `work/blocked/`.
5. When a task is complete, move its file to `work/completed/` and summarize the outcome in `docs/FEATURES.md`.
6. Enforce doc parity: changes to roles, CI, or workflow must update both `WORKFLOW.md` and this file.
7. Maintain CI configuration in `.github/workflows/ci.yml`.
8. The CI pipeline runs `scripts/doc_parity_check.sh` to verify doc parity.

## Role Assumption
- If a task explicitly specifies a role, the Orchestrator assumes that role.
- Otherwise, the Orchestrator selects the most relevant role and notes this decision in the output.
- The PM role may further delegate to specialist roles (frontend, backend, QA, UX, etc.).

## Role Files and Insights
- New role proposals live under `roles/request/` until the Orchestrator approves them.
- Approved roles are moved to `roles/hired/<role>.md` and each file stores the role preprompt.
- Agents append additional insights to their own file as they gain experience.
- Agents may only edit their own `roles/hired/<role>.md` file. Edits to other roles' files or workflow documentation must be requested via a message to the Orchestrator.
- Role switching into the Orchestrator is disallowed. Only tasks that explicitly request the Orchestrator can start it.
- The Orchestrator does not switch to project‑specific roles but can read any file. Its modifications are limited to workflow files and documentation.

## Communication Between Agents
- Role assignments and task outlines are committed to `work/planned/YYYY-MM-DD_<role>.agent.md`.
- Each of these task files is a short description that can be pasted directly into the Codex interface. Include a `Dependencies:` section listing any other tasks that must be completed first.
- See `work/planned/README.example.agent.md` for a sample file illustrating the expected format.
- Agents exchange progress updates or questions in `messages/YYYY-MM-DD_<from>_to_<to>.md`.
- Responses may be appended to the same file or placed in a new dated file.
- The Orchestrator reviews these message files to decide on further role switches.
- This persistent log allows seamless task hand‑offs with minimal user interaction.
- When a role starts a task it moves the file from `work/planned/` to `work/in_progress/`.
- If a task requires help from other roles, note those blockers inside the file, create the necessary tasks in `work/planned/`, and move the blocked task to `work/blocked/`.
- Roles should mark blockers resolved when completing their tasks. If the last blocker for a task is cleared, move that task back to `work/planned/`.

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
