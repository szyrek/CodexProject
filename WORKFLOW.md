# Codex Project Workflow

This repository defines a multi-agent workflow orchestrated by Codex. The Orchestrator dynamically assumes roles (Project Manager, Frontend, Backend, QA, etc.) to fulfill tasks.

## Role Switching
- The Orchestrator reviews each task and decides which role best fits.
- New tasks are placed in `work/planned/YYYY-MM-DD_<role>.agent.md`.
- See `AGENTS.md` for detailed rules.

Each role sources its role file at the start of work. New roles begin in `roles/request/` and, after onboarding, move to `roles/hired/` with any insights appended. Only the Orchestrator may edit other roles’ files or workflow documents; roles must request such changes via a message file.

## Agent Communication
Task assignments are committed to `work/planned/`. Agents leave messages for one another in `messages/inbox/YYYY-MM-DD_<from>_to_<to>.md` and move them to `messages/read/` after responding. Each reply notes which previous message it addresses. See the example files in those folders for the exact format; they are placeholders only.

## Task Requests and Dependencies
Each task file contains a concise description that can be pasted directly into the Codex web interface. Prefer small, single-responsibility tasks that one role can complete. When a task requires other tasks to finish first, add a `Dependencies:` section listing those prerequisites.

Tasks begin in `work/planned/`. When a role starts work it moves the task file to `work/in_progress/` to lock it. If the task needs help from another role, that role's tasks are created under `work/planned/` and the original file moves to `work/blocked/` with the blockers noted. Once all blockers are resolved, move the file back to `work/planned/` until it can be completed and placed in `work/completed/`.

## Documentation and Governance
- Workflow policies are recorded in `/docs/` as RFCs, ADRs, QA, and Security guidelines.
- Any change to roles, CI, or docs must update both `WORKFLOW.md` and `AGENTS.md` (dual-doc enforcement).
- Completed work is summarized in `/docs/FEATURES.md` after the corresponding task files are moved to `work/completed/`.

## Continuous Integration
- CI uses GitHub Actions (`.github/workflows/ci.yml`).
- Specific lint, test, and coverage steps are defined by project requirements gathered by the PM role.
- A doc parity check runs `scripts/doc_parity_check.sh` to ensure updates to roles or CI also modify both docs.

## Getting Started
1. Review `AGENTS.md` to understand how roles are assumed.
2. Consult `/roles/request/pm.md` for the PM role’s onboarding instructions.
3. Use the `/docs/` directory to track governance and security information.
4. Review `/docs/FEATURES.md` for a history of completed work.
