# Multi-Agent Delegation Strategy: Claude + Gemini + Qwen

## Quick Setup

```bash
# Add MCP servers
claude mcp add gemini gemini mcp start
claude mcp add qwen qwen mcp start

# Verify
claude mcp list
```

## Optimal Token Usage Strategy

### Agent Strengths & Cost Optimization

**Claude (Sonnet 4.5)** - Your coordinator
- Best for: Complex reasoning, code architecture, critical decisions
- Use when: Quality > cost, complex multi-step tasks
- Delegation role: Orchestrator, final reviewer

**Gemini**
- Best for: Fast prototyping, data analysis, creative exploration
- Use when: Need speed, creative solutions, multi-modal tasks
- Delegation role: Rapid iteration, research, ideation

**Qwen**
- Best for: Code generation, refactoring, documentation
- Use when: Large codebases, repetitive tasks, cost efficiency
- Delegation role: Implementation worker, bulk operations

## Delegation Patterns

### Pattern 1: Research → Design → Implement

```javascript
// Single message - parallel delegation via Claude Code Task tool

// Gemini: Fast research and exploration
Task("Gemini Research Agent",
  "Research rugby analysis ML approaches. Survey 10+ papers. Output: summary.md",
  "researcher")

// Claude: Architecture design (you're doing this now)
TodoWrite { todos: [
  {content: "Design system architecture", status: "in_progress"},
  {content: "Review research findings", status: "pending"},
  {content: "Delegate implementation", status: "pending"}
]}

// Qwen: Bulk implementation
Task("Qwen Implementation Agent",
  "Generate boilerplate for 15 Python modules. Use research findings from memory.",
  "coder")
```

### Pattern 2: Cost-Optimized Pipeline

```javascript
// High-level planning (Claude - expensive but critical)
[Claude coordinates]

// Bulk work (Qwen - cost efficient)
Task("Qwen Bulk Worker",
  "Generate test suites for all modules. 90% coverage target.",
  "tester")

// Creative enhancement (Gemini - fast iteration)
Task("Gemini Enhancement Agent",
  "Explore 5 alternative UI approaches. Generate mockups.",
  "researcher")

// Final review (Claude - quality control)
Task("Claude Reviewer",
  "Review all outputs. Make final architectural decisions.",
  "reviewer")
```

### Pattern 3: Parallel Specialization

```javascript
// Single message - all agents work concurrently

Task("Gemini - Data Analysis",
  "Analyze rugby-back-in-game-analysis.csv. Statistical insights.",
  "analyst")

Task("Qwen - Code Generation",
  "Implement data preprocessing pipeline from specs in docs/",
  "coder")

Task("Claude - Integration",
  "Integrate outputs, resolve conflicts, ensure quality",
  "system-architect")
```

## Token Cost Optimization Rules

### Rule 1: Delegate Heavy Lifting
```javascript
// ❌ BAD: Claude reads 50 files
Read "file1.py"
Read "file2.py"
// ... 48 more

// ✅ GOOD: Qwen reads and summarizes
Task("Qwen Scanner",
  "Read all Python files in src/. Create index of functions and classes.",
  "code-analyzer")
```

### Rule 2: Use Gemini for Exploration
```javascript
// ❌ BAD: Claude explores 10 approaches
[Claude generates 10 different implementations]

// ✅ GOOD: Gemini explores, Claude decides
Task("Gemini Explorer",
  "Generate 10 approaches for player tracking. Pros/cons each.",
  "researcher")

// Then Claude reviews Gemini's output and picks best
```

### Rule 3: Qwen for Repetitive Work
```javascript
// ❌ BAD: Claude generates 20 similar test files
Write "test1.js"
Write "test2.js"
// ...

// ✅ GOOD: Qwen generates bulk
Task("Qwen Test Generator",
  "Generate comprehensive test suites for all 20 modules. Jest + 90% coverage.",
  "tester")
```

## Memory Coordination Between Agents

```javascript
// Agent 1 (Gemini) stores research
npx claude-flow@alpha hooks post-task \
  --memory-key "research/rugby-ml-approaches" \
  --value "$(cat research-summary.md)"

// Agent 2 (Qwen) retrieves and implements
npx claude-flow@alpha hooks session-restore \
  --session-id "rugby-analysis"

Task("Qwen Implementation",
  "Implement ML approaches from memory key: research/rugby-ml-approaches",
  "coder")

// Agent 3 (Claude) reviews both
Task("Claude Final Review",
  "Review research + implementation. Check memory for context.",
  "reviewer")
```

## Real-World Example: Rugby Analysis Feature

```javascript
// Step 1: Initialize coordination (Claude Flow MCP)
mcp__claude-flow__swarm_init {
  topology: "mesh",
  maxAgents: 8
}

// Step 2: Parallel agent execution (Claude Code Task tool)
[Single Message - All Concurrent]:

// Gemini: Fast data exploration (cheap tokens)
Task("Gemini Data Explorer",
  `Analyze rugby-back-in-game-analysis.csv:
   - Statistical patterns
   - Anomaly detection
   - Feature correlations
   Output: docs/data-insights.md`,
  "analyst")

// Qwen: Bulk preprocessing code (efficient for repetitive work)
Task("Qwen Preprocessor",
  `Generate complete data preprocessing pipeline:
   - CSV parsing
   - Data validation
   - Feature engineering
   - Export utilities
   Output: src/preprocessing/`,
  "coder")

// Qwen: Test generation (bulk work)
Task("Qwen Test Engineer",
  `Generate comprehensive test suite:
   - Unit tests for all preprocessing functions
   - Integration tests for pipeline
   - Mock data generation
   Output: tests/preprocessing/`,
  "tester")

// Gemini: ML model exploration (creative task)
Task("Gemini ML Researcher",
  `Research and prototype 3 ML approaches:
   - Player performance prediction
   - Injury risk assessment
   - Return-to-play optimization
   Output: docs/ml-approaches.md + prototypes/`,
  "researcher")

// Claude: Architecture & coordination (high-value decisions)
TodoWrite { todos: [
  {content: "Monitor agent progress", status: "in_progress"},
  {content: "Review data insights from Gemini", status: "pending"},
  {content: "Validate Qwen preprocessing code", status: "pending"},
  {content: "Evaluate ML prototypes", status: "pending"},
  {content: "Integrate components", status: "pending"},
  {content: "Final quality review", status: "pending"}
]}
```

## Token Savings Estimate

**Traditional (Claude only):**
- Data analysis: 50K tokens
- Code generation: 80K tokens
- Tests: 40K tokens
- ML research: 60K tokens
- **Total: 230K tokens @ Claude pricing**

**Multi-Agent (Claude + Gemini + Qwen):**
- Data analysis (Gemini): 50K tokens @ Gemini pricing
- Code generation (Qwen): 80K tokens @ Qwen pricing
- Tests (Qwen): 40K tokens @ Qwen pricing
- ML research (Gemini): 60K tokens @ Gemini pricing
- Coordination (Claude): 20K tokens @ Claude pricing
- **Total: ~60-70% cost savings**

## Best Practices

1. **Claude = Conductor**: Use for orchestration, critical decisions, final review
2. **Gemini = Explorer**: Use for research, creative tasks, rapid prototypation
3. **Qwen = Worker**: Use for bulk code generation, tests, documentation
4. **Memory = Shared Brain**: All agents read/write to shared memory for coordination
5. **Hooks = Sync Points**: Use pre/post task hooks to synchronize agent work
6. **Single Message = Parallel**: Always batch agent spawning in one message

## Monitoring & Debugging

```bash
# Check which agents are using which MCP servers
claude mcp list

# Monitor token usage per agent
npx claude-flow@alpha hooks session-end --export-metrics true

# View memory coordination
npx claude-flow@alpha memory list

# Track performance
npx claude-flow@alpha metrics --timeframe 24h
```

## Next Steps

1. Run setup commands above to add Gemini/Qwen MCP servers
2. Test with small task: delegate file reading to Qwen
3. Scale up to full pipeline with all 3 agents
4. Monitor token savings and adjust strategy
5. Build reusable delegation patterns for your workflows
