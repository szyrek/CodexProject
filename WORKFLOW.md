# Codex Project Workflow

This repository defines a multi-agent workflow orchestrated by Codex. The Orchestrator Agent dynamically assumes roles (Project Manager, Frontend, Backend, QA, etc.) to fulfill tasks.

## Role Switching
- The Orchestrator reviews each task and decides which role best fits.
- Role switches are logged under `plans/YYYY-MM-DD_<role>.agent.md`.
- See `AGENTS.md` for detailed rules.

Each role keeps its own `roles/<role>.work.md` file updated with insights during execution. Only the Orchestrator may edit other roles’ files or workflow documents, and roles must request such changes via a message file.

## Agent Communication
Task assignments are committed to the `plans/` directory. Agents exchange progress or questions in `messages/YYYY-MM-DD_<from>_to_<to>.md`. These files provide a persistent record so the Orchestrator can seamlessly switch roles with minimal user involvement.

## Task Requests and Dependencies
Each plan file contains a concise task description that can be pasted directly into the Codex web interface. Prefer small, single-responsibility tasks that one role can complete. When a task requires other tasks to finish first, add a `Dependencies:` section listing those prerequisites.

## Documentation and Governance
- Workflow policies are recorded in `/docs/` as RFCs, ADRs, QA, and Security guidelines.
- Any change to roles, CI, or docs must update both `WORKFLOW.md` and `AGENTS.md` (dual-doc enforcement).
- Completed work is summarized in `/docs/FEATURES.md` after the related plan files are removed.

## Continuous Integration
- CI uses GitHub Actions (`.github/workflows/ci.yml`).
- Specific lint, test, and coverage steps are defined by project requirements gathered by the PM role.

## Getting Started
1. Review `AGENTS.md` to understand how roles are assumed.
2. Consult `/roles/pm.hire.md` for the PM role’s onboarding instructions.
3. Use the `/docs/` directory to track governance and security information.
4. Review `/docs/FEATURES.md` for a history of completed work.
