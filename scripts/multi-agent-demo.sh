#!/bin/bash
# Multi-Agent Delegation Demo: Claude + Gemini + Qwen

set -e

echo "🚀 Multi-Agent Delegation Demo"
echo "================================"

# Create output directories
mkdir -p docs/agent-outputs
mkdir -p src/agent-generated

echo ""
echo "📋 Step 1: Preparing agent prompts..."

# Gemini Research Prompt
cat > /tmp/gemini-research.txt << 'EOF'
Research the top 5 machine learning approaches for rugby injury analysis:
1. Focus on "back in game" prediction models
2. Include pros and cons for each approach
3. Cite recent papers or methods
4. Rank by effectiveness
Output as markdown with clear sections.
EOF

# Qwen Code Generation Prompt
cat > /tmp/qwen-codegen.txt << 'EOF'
Generate a complete Python module for rugby player data analysis:
- Class: RugbyPlayerData
- Methods: load_csv, validate_data, calculate_return_time, export_report
- Use pandas, numpy, and type hints
- Include docstrings
- Follow PEP 8
Output as clean Python code only.
EOF

echo "✅ Prompts prepared"

echo ""
echo "⚡ Step 2: Running agents in parallel..."
echo "  - Gemini: Research ML approaches"
echo "  - Qwen: Generate Python code"

# Run both agents concurrently
gemini -p "$(cat /tmp/gemini-research.txt)" > docs/agent-outputs/gemini-research.md 2>&1 &
GEMINI_PID=$!

qwen -p "$(cat /tmp/qwen-codegen.txt)" > src/agent-generated/player_data.py 2>&1 &
QWEN_PID=$!

# Wait for both to complete
echo "  Waiting for Gemini (PID: $GEMINI_PID)..."
wait $GEMINI_PID
echo "  ✅ Gemini completed"

echo "  Waiting for Qwen (PID: $QWEN_PID)..."
wait $QWEN_PID
echo "  ✅ Qwen completed"

echo ""
echo "📊 Step 3: Agent outputs summary"
echo "================================"

echo ""
echo "📄 Gemini Research Output:"
echo "---"
head -20 docs/agent-outputs/gemini-research.md
echo "..."
echo "(Saved to: docs/agent-outputs/gemini-research.md)"

echo ""
echo "💻 Qwen Code Output:"
echo "---"
head -30 src/agent-generated/player_data.py
echo "..."
echo "(Saved to: src/agent-generated/player_data.py)"

echo ""
echo "📈 Token Usage Estimate:"
echo "  - Gemini: ~2K tokens (research)"
echo "  - Qwen: ~1.5K tokens (code gen)"
echo "  - Claude: ~500 tokens (coordination)"
echo "  - Total: ~4K tokens across 3 agents"
echo ""
echo "  Compare to Claude-only: ~8K tokens"
echo "  Savings: ~50% ✅"

echo ""
echo "🎯 Next Steps:"
echo "  1. Review Gemini's research: cat docs/agent-outputs/gemini-research.md"
echo "  2. Review Qwen's code: cat src/agent-generated/player_data.py"
echo "  3. Integrate outputs into your codebase"
echo "  4. Use Claude for final review and refinement"

echo ""
echo "✨ Demo complete!"
