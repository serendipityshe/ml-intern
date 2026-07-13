#!/usr/bin/env bash
set -euo pipefail

uv run ruff check .
uv run ruff format --check .
uv run pytest

if git diff --name-only --cached -- frontend/ | grep -q .; then
  (
    cd frontend
    npm run lint
    npm run build
  )
fi
