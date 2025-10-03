# RUGBY "BACK IN GAME" ANALYSIS TEMPLATE
## Analysis Framework Based on Recognition Platform

### OBJECTIVE
Measure player work rate and recovery speed after ground contact events. Track whether players RUN (sprint 3-5m) or WALK to get back into position after:
- Tackles (making or receiving)
- Ball carries (when tackled)
- Cleanouts/ruck involvement
- Any ground contact in tackle zones

---

## GRADING SYSTEM

### Back in Game Performance Grades:
- **A (Green)**: Elite recovery
  - Time on ground: < 1.5 seconds
  - Recovery method: Immediate sprint
  - Distance: Covers 3-5m at speed
  - Ready for action: < 2 seconds total
  
- **B (Yellow)**: Good recovery
  - Time on ground: 1.5-2.5 seconds
  - Recovery method: Quick jog/run
  - Distance: Moves to position efficiently
  - Ready for action: 2-3 seconds total
  
- **C (Orange)**: Average recovery
  - Time on ground: 2.5-4 seconds
  - Recovery method: Walk then jog
  - Distance: Slow initial movement
  - Ready for action: 3-5 seconds total
  
- **D (Red)**: Poor recovery
  - Time on ground: > 4 seconds
  - Recovery method: Walk to position
  - Distance: No urgency shown
  - Ready for action: > 5 seconds total

---

## DATA COLLECTION TEMPLATE

### Event Recording Structure:

| Field | Description | Example |
|-------|-------------|---------|
| Video_ID | Which camera angle | Video_1 |
| Timestamp | Time in video | 02:34 |
| Player_Number | Jersey number | 7 |
| Event_Type | Action category | Tackle_Made |
| Event_Category | Attack/Defence/Breakdown | Defence |
| Hit_Ground | Did player go to ground? | Yes |
| Time_On_Ground | Seconds from contact to standing | 1.2 |
| Recovery_Method | RUN or WALK first 3-5m | RUN |
| Time_To_Ready | Total seconds until ready | 1.8 |
| Back_In_Game_Grade | A, B, C, or D | A |
| Context | Phase, score, time remaining | 1st Half, 12:30 |
| Notes | Additional observations | Great urgency shown |

---

## EVENT TYPE CLASSIFICATIONS

### ATTACK Events:
1. **Ball Carry (Tackled)** - Player carrying ball, goes to ground in tackle
2. **Ball Placement** - After tackle, placing ball back
3. **Support at Breakdown** - Arriving at ruck to secure ball
4. **Cleanout** - Clearing defending players from ruck
5. **Tackle Received** - Being tackled while carrying

### DEFENCE Events:
1. **Tackle (Individual)** - Solo tackle, player goes to ground
2. **Tackle (Assist)** - Helping in tackle, may go to ground
3. **Post-Tackle Effort** - Fighting for ball after tackle made
4. **Tackle Contest** - Competing at breakdown after tackle
5. **Counter-Ruck** - Arriving to disrupt opposition ball

### BREAKDOWN Events:
1. **Ruck Arrival** - Any arrival at ruck (1st, 2nd, 3rd, etc.)
2. **Cleanout** - Clearing opposition
3. **Seal** - Sealing off ball
4. **Support** - Supporting ball carrier

---

## SAMPLE DATA OUTPUT FORMAT

```csv
Video_ID,Timestamp,Player_Number,Event_Type,Event_Category,Hit_Ground,Time_On_Ground,Recovery_Method,Time_To_Ready,Back_In_Game_Grade,Ruck_Arrival,Notes
Video_1,00:45,7,Tackle_Made,Defence,Yes,1.1,RUN,1.6,A,N/A,Excellent urgency
Video_1,01:23,12,Ball_Carry,Attack,Yes,2.3,WALK,4.1,C,N/A,Slow to feet
Video_1,01:25,4,Ruck_Arrival,Breakdown,Yes,0.9,RUN,1.4,A,1st,First to ruck
Video_2,00:15,15,Tackle_Assist,Defence,Yes,1.8,RUN,2.2,B,N/A,Good recovery
Video_2,02:10,8,Cleanout,Breakdown,Yes,3.2,WALK,5.8,D,3rd,Very slow
Video_3,00:52,3,Ball_Carry,Attack,Yes,1.5,RUN,2.0,B,N/A,Good placement
Video_3,01:34,21,Tackle_Made,Defence,Yes,1.0,RUN,1.5,A,N/A,Sprint to position
Video_4,00:28,10,Ruck_Arrival,Breakdown,Yes,2.1,WALK,3.8,C,2nd,Average effort
```

---

## ANALYSIS SUMMARY FORMAT

### Individual Player Summary:

**Player #7 - Back in Game Analysis**

| Metric | Value |
|--------|-------|
| Total Ground Events | 12 |
| RUN Recovery | 9 (75%) |
| WALK Recovery | 3 (25%) |
| Average Time on Ground | 1.4s |
| Average Time to Ready | 2.1s |
| Grade Distribution | A: 7, B: 3, C: 2, D: 0 |
| Back in Game Score | 83.3% (A-B rate) |

**By Event Type:**
- Tackles Made: 5 events (80% RUN recovery, Avg Grade: A)
- Ball Carries: 4 events (75% RUN recovery, Avg Grade: B)
- Ruck Arrivals: 3 events (67% RUN recovery, Avg Grade: A)

**Context Notes:**
- Consistently shows urgency in defence
- Slightly slower recovery when carrying ball
- Elite ruck arrival work rate

---

### Team Summary:

**Team Back in Game Performance**

| Player # | Events | RUN % | Avg Time to Ready | Grade Avg | Back in Game Score |
|----------|--------|-------|-------------------|-----------|-------------------|
| 1 | 8 | 62% | 2.8s | B | 75.0% |
| 2 | 6 | 83% | 1.9s | A | 83.3% |
| 3 | 10 | 70% | 2.3s | B+ | 80.0% |
| 4 | 9 | 56% | 3.1s | C+ | 66.7% |
| 7 | 12 | 75% | 2.1s | A- | 83.3% |
| 8 | 11 | 64% | 2.6s | B | 72.7% |

**Team Averages:**
- Overall RUN Recovery Rate: 68%
- Average Time to Ready: 2.5s
- A-B Grade Rate: 76.7%
- Team Back in Game Score: 76.7%

**Performance by Phase:**
- Attack Events: 65% RUN recovery
- Defence Events: 78% RUN recovery
- Breakdown Events: 62% RUN recovery

---

## VISUALIZATION RECOMMENDATIONS

1. **Player Heatmap**: Show back-in-game grades across different event types
2. **Timeline Chart**: Plot recovery times throughout the match
3. **Comparison Chart**: Compare RUN vs WALK recovery by player
4. **Distribution Graph**: Show grade distribution (A, B, C, D) per player
5. **Trend Analysis**: Track if recovery deteriorates as match progresses

---

## CODING INSTRUCTIONS

### Step-by-Step Process:

1. **Watch Video 1**
   - Identify target player(s) if specified
   - Note every ground contact event
   - Pause and measure time on ground using video timeline
   - Assess recovery method (first 3-5m movement)
   - Record in spreadsheet

2. **Cross-Reference with Other Angles** (Videos 2-4)
   - Confirm timings
   - Get better view of recovery method
   - Note any missed events
   - Validate grading decisions

3. **Calculate Metrics**
   - Time on ground (contact → standing)
   - Time to ready position (contact → ready)
   - Assign grade based on criteria

4. **Contextual Notes**
   - Match situation
   - Score differential
   - Fatigue factors (time in match)
   - Previous sequence involvement

---

## QUALITY CONTROL CHECKLIST

- [ ] All ground contact events identified
- [ ] Times measured accurately using video controls
- [ ] Recovery method clearly observed (RUN vs WALK)
- [ ] Grades assigned consistently using criteria
- [ ] Cross-referenced across multiple camera angles
- [ ] Contextual notes added where relevant
- [ ] Data validated for errors/inconsistencies
- [ ] Summary statistics calculated
- [ ] Individual player reports generated

---

## DELIVERABLE FORMAT

### Final Output Should Include:

1. **Raw Data File** (CSV format)
   - All events coded with timestamps
   - Complete measurements
   - Grades assigned

2. **Individual Player Reports**
   - Summary statistics
   - Grade distribution
   - Performance by event type
   - Contextual observations

3. **Team Summary Report**
   - Team averages and benchmarks
   - Player comparisons
   - Key insights and trends

4. **Visual Dashboard** (optional)
   - Charts and graphs
   - Performance heatmaps
   - Comparison visualizations

---

## KEY PERFORMANCE INDICATORS

### Primary KPIs:
- **RUN Recovery Rate**: % of ground events followed by running recovery
- **Back in Game Score**: % of A+B grades
- **Average Time to Ready**: Mean seconds from contact to ready position

### Secondary KPIs:
- Time on ground average
- Recovery method by event type
- Performance by match phase
- Consistency across different contexts

---

This framework allows systematic coding of player work rate and recovery speed, providing quantifiable "back in game" metrics that can inform training, selection, and tactical decisions.
