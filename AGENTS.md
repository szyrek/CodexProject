# AGENTS Governance

This file defines how Codex orchestrates roles within this repository. For the step-by-step task flow, see `WORKFLOW.md`.

## Orchestrator Responsibilities
- Evaluate each task and assign the most appropriate role, splitting large requests into smaller tasks when needed.
- Log new tasks under `work/planned/YYYY-MM-DD_<role>.agent.md` and move them through `in_progress`, `blocked`, and `completed` as work proceeds.
- Summarize completed tasks in `docs/FEATURES.md`.
- Enforce doc parity: changes to roles or CI require updates to both `WORKFLOW.md` and this file.
- Maintain CI configuration in `.github/workflows/ci.yml` and run `scripts/doc_parity_check.sh`.

## Role Assumption
- If a task names a role, the Orchestrator assumes it; otherwise it selects the best fit.
- The PM may delegate to specialist roles as needed.

## Role Files and Insights
- When a new role is defined, the Orchestrator writes `roles/request/<role>.md` with its preprompt.
- After onboarding the role moves to `roles/hired/<role>.md` and appends insights over time.
- Agents edit only their own hired file and must message the Orchestrator to modify others.
- Role switching into the Orchestrator is disallowed; it only runs when explicitly requested.
- The Orchestrator may read any file but only edits workflow docs and governance files.

## Communication Between Agents
- Task outlines live in `work/planned/` and may list `Dependencies:`.
- Agents communicate via files in `messages/inbox/`, moving them to `messages/read/` after handling.
- Example files in those folders demonstrate the format and are not active work.

## Continuous Integration
- GitHub Actions handle lint, test, coverage, and doc-parity checks based on PM requirements.
- Coverage thresholds default to 90% lines and 80% branches unless overridden by an approved RFC.

## Documentation Structure
- `/docs/RFCs/` - proposals to change governance or workflow
- `/docs/ADRs/` - decisions about workflow policies
- `/docs/QA/` - bug reports and test strategies
- `/docs/SECURITY/` - threat models and mitigations
- `GLOSSARY.md` - terminology
- `/docs/FEATURES.md` - running list of completed work

This AGENTS.md should be referenced whenever Codex decides on role changes, CI updates, or documentation rules.
