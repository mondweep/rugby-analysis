# ⚠️ IMPORTANT: Gemini & Qwen Are NOT MCP Servers

## The Truth About Gemini and Qwen

**Gemini and Qwen CANNOT run as MCP servers.**

They are:
- ✅ CLI tools (command-line interfaces)
- ✅ MCP **clients** (they can consume MCP servers)
- ❌ NOT MCP **servers** (they cannot be added to Claude)

## Why `claude mcp add gemini/qwen` Fails

```bash
# This will ALWAYS fail:
claude mcp add gemini gemini mcp start  # ❌ No such command
claude mcp add qwen qwen mcp start      # ❌ No such command

# Gemini/Qwen only support these MCP commands:
gemini mcp add <name> <command>    # Add MCP server TO Gemini
gemini mcp list                    # List Gemini's MCP servers
qwen mcp add <name> <command>      # Add MCP server TO Qwen
qwen mcp list                      # List Qwen's MCP servers
```

## The Correct Approach

### Architecture
```
YOU (Claude) - The orchestrator with file tools
    ↓
    Uses Bash to run:
    ├── gemini -p "prompt"    → captures output
    └── qwen -p "prompt"      → captures output
```

### Working Examples

#### Example 1: Sequential Delegation

```bash
# Step 1: Gemini researches
gemini -p "Research rugby injury ML models. List top 3." > /tmp/research.txt

# Step 2: Read Gemini's output
cat /tmp/research.txt

# Step 3: Qwen generates code based on research
qwen -p "Generate Python class for model training using: $(cat /tmp/research.txt)" > src/model.py

# Step 4: Claude (you) reviews and integrates
# [Review files, make decisions, write final code]
```

#### Example 2: Parallel Delegation

```bash
# Run both simultaneously
gemini -p "Analyze rugby-back-in-game-analysis.csv statistics" > /tmp/stats.txt &
qwen -p "Generate CSV parser with pandas" > /tmp/parser.py &

# Wait for both to complete
wait

# Claude processes results
cat /tmp/stats.txt
cat /tmp/parser.py
```

#### Example 3: Using Task Tool

```javascript
// You can delegate via Task tool by including bash commands
Task("Research Agent",
  `Execute this workflow:
  1. Run: gemini -p "Research X" > docs/research.md
  2. Store key findings in memory
  3. Report completion`,
  "researcher")

Task("Code Agent",
  `Execute this workflow:
  1. Run: qwen -p "Generate Y" > src/code.py
  2. Validate syntax
  3. Report completion`,
  "coder")
```

## Your Current Working MCP Servers

```bash
claude mcp list
# ✅ claude-flow@alpha - Swarm coordination
# ✅ ruv-swarm - Advanced swarm features
# ✅ flow-nexus - Cloud features
# ✅ agentic-payments - Payment coordination
```

**These are actual MCP servers. Gemini/Qwen are NOT.**

## Token Optimization Strategy

### When to Use Each Tool

**Claude (You):**
- Architecture decisions
- File operations (Read, Write, Edit)
- Complex reasoning
- Final integration
- Code review

**Gemini (via Bash):**
- Research tasks
- Data analysis
- Creative exploration
- Multi-modal tasks
- Fast iteration

**Qwen (via Bash):**
- Code generation
- Bulk operations
- Documentation
- Test generation
- Refactoring

### Cost Comparison

**Scenario: Generate Rugby Analysis Module**

**All Claude:**
```
Research: 2K tokens
Design: 1K tokens
Code: 3K tokens
Tests: 2K tokens
Total: 8K tokens @ Claude pricing
```

**Multi-Agent:**
```
Research (Gemini via bash): 2K @ Gemini pricing
Code (Qwen via bash): 3K @ Qwen pricing
Tests (Qwen via bash): 2K @ Qwen pricing
Integration (Claude): 1K @ Claude pricing
Total: ~60% cost savings
```

## Practical Workflow

### Step 1: Delegate Research to Gemini

```bash
# I (Claude) run this:
gemini -p "Research ML approaches for rugby injury prediction.
Include:
- Algorithm types
- Data requirements
- Success metrics
Output as markdown." > docs/ml-research.md
```

### Step 2: Delegate Code to Qwen

```bash
# I (Claude) run this based on Gemini's research:
qwen -p "Generate Python module for injury prediction.
Requirements from research: $(head -50 docs/ml-research.md)
Include:
- Data loading
- Model training
- Prediction API
Output as clean Python code." > src/injury_predictor.py
```

### Step 3: Claude Integrates

```python
# I (Claude) review both outputs and:
# - Fix any issues
# - Add error handling
# - Write integration tests
# - Update documentation
# - Commit changes
```

## Quick Reference Commands

```bash
# Test Gemini
echo "What is 2+2?" | gemini -p

# Test Qwen
echo "Generate hello function" | qwen -p

# Delegation wrapper
./scripts/delegate.sh gemini "prompt" output.txt
./scripts/delegate.sh qwen "prompt" output.py

# Working example
./scripts/working-delegation-example.sh
```

## Common Mistakes to Avoid

### ❌ WRONG: Trying to add as MCP server
```bash
claude mcp add gemini gemini mcp start  # FAILS
claude mcp add qwen qwen mcp start      # FAILS
```

### ✅ CORRECT: Use via Bash
```bash
# In your prompt to Claude:
"Run gemini to research X and qwen to generate Y"

# Claude executes:
gemini -p "research X" > research.txt
qwen -p "generate Y" > code.py
```

## Summary

1. **Gemini and Qwen are NOT MCP servers** - Don't try to add them with `claude mcp add`
2. **Use them via Bash** - Run as CLI commands and capture output
3. **Claude orchestrates** - You read their outputs and integrate
4. **Optimize costs** - Delegate heavy lifting to cheaper models
5. **MCP is for coordination** - Use claude-flow, ruv-swarm for swarm coordination

## Need Help?

- Working examples: `./scripts/working-delegation-example.sh`
- Delegation wrapper: `./scripts/delegate.sh`
- Full guide: `docs/multi-agent-delegation.md`
