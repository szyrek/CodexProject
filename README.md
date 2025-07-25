# Codex Project Template

This repository serves as a starting point for new multi-agent projects. It contains a working example of the Codex workflow along with governance documentation.

## Using this template

1. **Create your new project repository.** You can either use GitHub's "Use this template" feature or clone this repo and push to a new remote.
2. **Copy the contents of this template into your project.** Retain `WORKFLOW.md`, `AGENTS.md`, and the `docs/` directory so your project follows the same governance.
3. **Replace project-specific sections.** Update `README.md` in your project to describe your own code and goals while keeping `WORKFLOW.md` for the shared process.
4. **Customize roles and CI as needed.** Add or modify role files under `roles/` and update CI steps once your tooling is defined.

Refer to `WORKFLOW.md` for details on how agents communicate and how tasks are orchestrated. Example task and message files in `work/planned/` and `messages/inbox/` demonstrate the expected format. They are placeholders and do not represent active work.

## Version

The current release is **0.0.2** as recorded in `VERSION.txt`. See `CHANGELOG.md` for details.
