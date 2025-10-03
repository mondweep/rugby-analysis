#!/bin/bash
# CORRECT Multi-Agent Delegation Demo
# Shows how to actually use Gemini and Qwen (NOT as MCP servers)

set -e

echo "╔════════════════════════════════════════════════╗"
echo "║  CORRECT Multi-Agent Delegation Demo          ║"
echo "║  Gemini + Qwen via Bash (NOT MCP servers)     ║"
echo "╚════════════════════════════════════════════════╝"
echo ""

# Setup - Use workspace directory so files are visible
DEMO_DIR="/workspaces/rugby-analysis/delegation-demo"
mkdir -p "$DEMO_DIR"

echo "📋 Scenario: Build Rugby Analysis Module"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Step 1: Gemini Research
echo "🔵 STEP 1: Gemini researches ML approaches"
echo "   Command: gemini -p \"...\" > $DEMO_DIR/research.txt"
echo ""

gemini -p "List 3 ML models for sports injury prediction.
For each model, provide:
- Name
- Key strength
- Best use case
Keep it brief, 2-3 sentences per model." > "$DEMO_DIR/research.txt" 2>&1

echo "   ✅ Gemini completed research"
echo "   Preview:"
head -8 "$DEMO_DIR/research.txt" | sed 's/^/      /'
echo ""

# Step 2: Qwen Code Generation
echo "🟣 STEP 2: Qwen generates boilerplate code"
echo "   Command: qwen -p \"...\" > $DEMO_DIR/code.py"
echo ""

qwen -p "Generate a simple Python function:

def predict_injury_risk(player_data: dict) -> float:
    # Calculate risk score 0-100
    # Use player_data keys: age, training_load, injury_history
    pass

Just the code, no explanation." > "$DEMO_DIR/code.py" 2>&1

echo "   ✅ Qwen completed code generation"
echo "   Preview:"
grep -E "^def |^    " "$DEMO_DIR/code.py" | head -10 | sed 's/^/      /' || echo "      (code generated)"
echo ""

# Step 3: Claude Integration
echo "⚪ STEP 3: Claude (me) integrates both"
echo "   Tasks:"
echo "      ✓ Read Gemini's research"
echo "      ✓ Read Qwen's code"
echo "      ✓ Make architectural decisions"
echo "      ✓ Write final implementation"
echo "      ✓ Add error handling"
echo "      ✓ Write tests"
echo ""

# Results
echo "📊 RESULTS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Generated files:"
echo "  📄 Research: $DEMO_DIR/research.txt ($(wc -l < "$DEMO_DIR/research.txt") lines)"
echo "  💻 Code:     $DEMO_DIR/code.py ($(wc -l < "$DEMO_DIR/code.py") lines)"
echo ""

echo "💰 Token Usage Estimate:"
echo ""
echo "  Method 1: Claude Only"
echo "  ├─ Research:      2000 tokens @ \$0.015/1K"
echo "  ├─ Code Gen:      1500 tokens @ \$0.015/1K"
echo "  ├─ Integration:    500 tokens @ \$0.015/1K"
echo "  └─ Total:         4000 tokens = \$0.06"
echo ""
echo "  Method 2: Multi-Agent (THIS DEMO)"
echo "  ├─ Gemini:        2000 tokens @ \$0.002/1K (estimated)"
echo "  ├─ Qwen:          1500 tokens @ \$0.001/1K (estimated)"
echo "  ├─ Claude:         500 tokens @ \$0.015/1K"
echo "  └─ Total:         4000 tokens = \$0.01"
echo ""
echo "  💵 Savings: ~83% cost reduction"
echo ""

echo "📁 Files created (in your workspace):"
cat << EOF

$DEMO_DIR/
├── research.txt    ← Gemini's ML research
└── code.py         ← Qwen's boilerplate

Next steps:
1. Review: cat $DEMO_DIR/research.txt
2. Review: cat $DEMO_DIR/code.py
3. Integrate: Claude combines both into final module
4. Test: Write tests for the integrated module
5. Deploy: Add to your codebase
EOF

echo ""
echo "✨ DEMO COMPLETE"
echo ""
echo "Key Takeaways:"
echo "  ✓ Gemini/Qwen are CLI tools, NOT MCP servers"
echo "  ✓ Use them via bash: gemini -p \"...\" > output.txt"
echo "  ✓ Claude orchestrates and integrates outputs"
echo "  ✓ Massive cost savings vs Claude-only approach"
echo ""
echo "See docs/CORRECT-DELEGATION-SETUP.md for full guide"
