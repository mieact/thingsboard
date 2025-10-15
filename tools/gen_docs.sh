#!/usr/bin/env bash
set -euo pipefail

OUT_DIR="docs"
mkdir -p "$OUT_DIR"

# Architecture (whole repo)
claude -p < docs/prompts/01_architecture.txt > "${OUT_DIR}/architecture.md"

# Module (rule-engine) — adjust module name if needed
claude -p < docs/prompts/02_module_rule_engine.txt > "${OUT_DIR}/rule-engine.md"

echo "Generated: docs/architecture.md, docs/rule-engine.md"

