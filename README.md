# Codex Project Workflow

This repository defines a multi-agent workflow orchestrated by Codex. The Orchestrator Agent dynamically assumes roles (Project Manager, Frontend, Backend, QA, etc.) to fulfill tasks.

## Role Switching
- The Orchestrator reviews each task and decides which role best fits.
- Role switches are logged under `plans/YYYY-MM-DD_<role>.agent.md`.
- See `AGENTS.md` for detailed rules.

## Documentation and Governance
- Workflow policies are recorded in `/docs/` as RFCs, ADRs, QA, and Security guidelines.
- Any change to roles, CI, or docs must update both this README and `AGENTS.md` (dual-doc enforcement).

## Continuous Integration
- CI uses GitHub Actions (`.github/workflows/ci.yml`).
- Specific lint, test, and coverage steps are defined by project requirements gathered by the PM role.

## Getting Started
1. Review `AGENTS.md` to understand how roles are assumed.
2. Consult `/roles/pm.hire.md` for the PM role’s onboarding instructions.
3. Use the `/docs/` directory to track governance and security information.
