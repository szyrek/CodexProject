# Changelog

All notable changes to this project will be documented in this file.

## [0.0.1] - 2025-07-25
### Added
- Initial workflow scaffolding with CI template and governance documents.
- Persistent messaging system for inter-agent communication via `messages/`.
- `VERSION.txt` with initial version 0.0.1.

## [0.0.2] - 2025-07-26
### Changed
- Messages are now organized under `messages/inbox/` and `messages/read/`.
- Agents move handled messages to `read/` and reference previous messages when replying.
