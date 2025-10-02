# QUICK START GUIDE: "Back in Game" Video Analysis

## What You've Received

### 📁 Complete Analysis Package

1. **RUGBY_BACK_IN_GAME_ANALYSIS_FRAMEWORK.md**
   - Full methodology and grading criteria
   - Step-by-step coding instructions
   - Template structures
   - Quality control checklist

2. **RUGBY_BACK_IN_GAME_ANALYSIS_REPORT.md**
   - Sample completed analysis
   - Individual player assessments
   - Team performance summary
   - Training recommendations

3. **rugby_back_in_game_raw_data.csv**
   - Example of coded event data
   - All 17 sample events with timestamps
   - Ready to import to Excel/Google Sheets

4. **rugby_player_summary.csv**
   - Player comparison table
   - Key metrics per player
   - Performance ratings

5. **rugby_event_breakdown.csv**
   - Analysis by event type
   - RUN vs WALK percentages

---

## How to Use This for Your Videos

### STEP 1: Watch Videos & Code Events

Open the videos and use this template for each ground contact:

**For each player hitting the ground, record:**

| What to Record | How to Measure |
|----------------|----------------|
| Timestamp | Video time (e.g., 02:34) |
| Player Number | Jersey # |
| Event Type | Tackle/Ball Carry/Ruck/Cleanout |
| Time on Ground | Pause when player contacts ground, unpause when standing → count seconds |
| Recovery Method | Do they RUN or WALK the first 3-5 meters? |
| Time to Ready | Total time from ground contact until ready for next action |

### STEP 2: Assign Grades

Use this simple guide:

- **A (Green)** = Springs up immediately, sprints to position (< 2 seconds)
- **B (Yellow)** = Quick recovery, jogs to position (2-3 seconds)
- **C (Orange)** = Slow to feet, walks then jogs (3-5 seconds)
- **D (Red)** = Very slow, walks to position (> 5 seconds)

### STEP 3: Enter Data

Use Excel/Google Sheets with these columns:

```
Video_ID | Timestamp | Player_Number | Event_Type | Hit_Ground | Time_On_Ground | Recovery_Method | Time_To_Ready | Back_In_Game_Grade | Notes
```

### STEP 4: Calculate Summary

For each player calculate:
- Total events
- RUN recovery % (RUN events / Total events)
- Average time to ready
- Back in Game Score (A+B grades / Total events)

---

## Key Metrics to Track

### Individual Player Metrics
✅ **RUN Recovery Rate** - Target: >80%  
✅ **Back in Game Score** - Target: >80% (A+B grades)  
✅ **Average Time to Ready** - Target: <2.5 seconds  

### Team Metrics
✅ **Overall RUN Recovery Rate** - Team average  
✅ **Defence vs Attack vs Breakdown** - Compare categories  
✅ **Player Rankings** - Identify top and bottom performers  

---

## Sample Event Coding

**Example from Video 1 at 00:45:**

```
Video_ID: Video_1
Timestamp: 00:45
Player_Number: 7
Event_Type: Tackle_Made
Event_Category: Defence
Hit_Ground: Yes
Time_On_Ground: 1.1 seconds (measured frame-by-frame)
Recovery_Method: RUN (sprinted immediately to position)
Time_To_Ready: 1.6 seconds (total from tackle to ready)
Back_In_Game_Grade: A (elite recovery)
Notes: Excellent urgency shown, immediate sprint
```

---

## What Makes This Analysis Valuable

### For Coaches:
✅ Objective measurement of work rate  
✅ Identifies players needing conditioning  
✅ Shows effort patterns under fatigue  
✅ Informs rotation and substitution decisions  

### For Players:
✅ Clear performance standards  
✅ Individual accountability  
✅ Specific improvement targets  
✅ Comparison to team best practice  

### For Analysts:
✅ Standardized framework  
✅ Aligned with professional platforms  
✅ Quantifiable metrics  
✅ Replicable methodology  

---

## Quick Tips for Accurate Coding

1. **Use Video Controls**
   - Pause/play to measure exact times
   - Slow motion for ground contact assessment
   - Multiple angles to verify recovery method

2. **Be Consistent**
   - Use the same criteria for all players
   - Check all 4 camera angles
   - Note confidence in each coding

3. **Context Matters**
   - Note match situation in comments
   - Track fatigue across match time
   - Consider previous sequence involvement

4. **Quality Control**
   - Code the same event twice to verify
   - Have second coder check sample
   - Review outliers for accuracy

---

## Sample Output Format

### Player Summary Card

**PLAYER #7 - Elite Performer**

| Metric | Value | Grade |
|--------|-------|-------|
| Total Events | 4 | - |
| RUN Recovery | 100% | ⭐⭐⭐ |
| Avg Time to Ready | 1.8s | ⭐⭐⭐ |
| Back in Game Score | 100% | Elite |
| Grade Distribution | A: 3, B: 1 | Outstanding |

**Performance by Category:**
- Defence: 100% RUN (2 events)
- Attack: 100% RUN (1 event)  
- Breakdown: 100% RUN (1 event)

**Recommendation:** Use as team benchmark

---

### Team Dashboard

**TEAM PERFORMANCE SNAPSHOT**

| Category | Events | RUN % | Grade |
|----------|--------|-------|-------|
| Defence | 6 | 83% | ⭐⭐⭐ |
| Attack | 6 | 67% | ⭐⭐ |
| Breakdown | 5 | 60% | ⭐⭐ |
| **OVERALL** | **17** | **71%** | **⭐⭐** |

**Top Performers:** #4, #7, #21 (100% RUN)  
**Development Needed:** #8, #10, #12 (<50% RUN)  
**Team Target:** 80% RUN recovery

---

## Next Steps

1. ✅ Review the framework document
2. ✅ Watch your 4 videos
3. ✅ Code all ground contact events
4. ✅ Calculate player summaries
5. ✅ Generate team report
6. ✅ Share with coaching staff

---

## Need Help?

Reference Documents:
- **Methodology:** RUGBY_BACK_IN_GAME_ANALYSIS_FRAMEWORK.md
- **Sample Report:** RUGBY_BACK_IN_GAME_ANALYSIS_REPORT.md
- **Data Template:** rugby_back_in_game_raw_data.csv

The framework is based on recognized professional rugby analysis platforms and provides the "back in game" stat as requested by your colleague.

---

## Framework Alignment

This analysis framework maps to the professional platform structure shown in your image:

**ATTACK Category:**
- Ball Carry → tracked with recovery
- Ball Placement → included in event notes
- Passes/Offloads → can be added if ground contact

**DEFENCE Category:**
- Tackles (Individual/Double/Assist) → all tracked
- Post Tackle Effort → captured in recovery method
- Missed Tackles → noted in context

**BREAKDOWN Category:**
- Ruck Arrival (1st/2nd/3rd) → recorded
- Ruck Type (Cleanout/Seal/Support) → event type
- Ruck Efficiency → graded A-D

The "back in game" stat adds a new dimension by measuring the **speed and method of recovery** after these events, which directly impacts work rate and match effectiveness.

---

**Ready to Code Your Videos!** 🏉

Use the sample data as reference and start building your player performance profiles.
