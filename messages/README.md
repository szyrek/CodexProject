# Agent Communication Directory

Agents exchange asynchronous messages in the `inbox/` folder. Each file should be named `YYYY-MM-DD_<from>_to_<to>.md` and contain the context or question for the next agent.

Once an agent responds or acts, it moves the message to the `read/` folder. Follow-up messages should include a note referencing the original message they address.

This directory remains under version control so the Orchestrator can track progress with minimal user interaction.
