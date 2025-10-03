#!/bin/bash
# Universal agent delegation wrapper
# Usage: ./delegate.sh <agent> <prompt> [output-file]

set -e

AGENT=$1
PROMPT=$2
OUTPUT=${3:-/dev/stdout}

if [ -z "$AGENT" ] || [ -z "$PROMPT" ]; then
  echo "Usage: $0 <agent> <prompt> [output-file]"
  echo ""
  echo "Agents:"
  echo "  gemini  - Google Gemini (research, creative tasks)"
  echo "  qwen    - Qwen (code generation, bulk work)"
  echo ""
  echo "Examples:"
  echo "  $0 gemini 'Research ML models' docs/research.md"
  echo "  $0 qwen 'Generate Python class' src/module.py"
  exit 1
fi

case "$AGENT" in
  gemini)
    echo "🔵 Delegating to Gemini..." >&2
    gemini -p "$PROMPT" > "$OUTPUT"
    ;;
  qwen)
    echo "🟣 Delegating to Qwen..." >&2
    qwen -p "$PROMPT" > "$OUTPUT"
    ;;
  *)
    echo "❌ Unknown agent: $AGENT" >&2
    exit 1
    ;;
esac

echo "✅ Agent $AGENT completed: $OUTPUT" >&2
