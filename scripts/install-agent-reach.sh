#!/usr/bin/env bash
# Install Agent Reach (https://github.com/Panniantong/agent-reach) and its
# OpenCLI dependency, following the project's docs/install.md.
# Note: the PyPI package named "agent-reach" is NOT this project.
set -euo pipefail

if ! command -v uv >/dev/null 2>&1; then
  curl -LsSf https://astral.sh/uv/install.sh | sh
  export PATH="$HOME/.local/bin:$PATH"
fi

if ! command -v agent-reach >/dev/null 2>&1; then
  uv tool install https://github.com/Panniantong/Agent-Reach/releases/latest/download/agent-reach.zip
fi

agent-reach setup

# Adding a browser-backed channel installs Node, the pinned OpenCLI release
# (@jackwener/opencli 1.8.7), the shared browser and the OpenCLI extension.
agent-reach add "${AGENT_REACH_CHANNEL:-reddit}"

agent-reach doctor --text
