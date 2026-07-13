#!/usr/bin/env bash
set -euo pipefail

uv sync --locked --extra dev

if [ -f frontend/package-lock.json ]; then
  (
    cd frontend
    npm ci
  )
fi
