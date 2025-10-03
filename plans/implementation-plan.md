# Rugby "Back in Game" Analysis - Implementation Plan

## Project Overview
Analyze rugby match videos to track player "back in game" statistics - measuring how quickly players get up after ground contact and whether they RUN (not walk) for the first 3-5 meters to be ready for their next action.

## Input Videos
- Video 1: https://youtu.be/fjHROgxSy_s
- Video 2: https://youtu.be/25wuJUQ--R0
- Video 3: https://youtu.be/Sa5Yi71kVFw
- Video 4: https://youtu.be/ObJc7QYpw88

**Note:** These are the same event from different camera angles

## Key Metrics to Track

### 1. Ground Contact Events
- Tackles (attacking/defending)
- Ball carries
- Cleanouts
- Any tackle zone activity

### 2. Performance Metrics
- **T0**: Time when player hits the ground
- **T1**: Time when player gets up
- **T2**: Time when player is back in position
- **Movement Type**: RUN vs WALK for first 3-5 meters
- **Recovery Time**: T1 - T0
- **Reposition Time**: T2 - T1
- **Total Back-in-Game Time**: T2 - T0

## Implementation Phases

### Phase 1: Video Processing Setup
**Objectives:**
- Download and synchronize all 4 video angles
- Extract frames for analysis
- Establish common timeline across angles

**Tasks:**
1. Download videos using youtube-dl/yt-dlp
2. Convert to common format (1080p, 30fps)
3. Sync videos using audio/visual markers
4. Extract frame timestamps

**Tools:**
- yt-dlp for video download
- FFmpeg for video processing
- OpenCV for frame extraction

### Phase 2: Player Detection & Tracking
**Objectives:**
- Identify all players in frame
- Track individual players across frames and camera angles
- Maintain player identity throughout the match

**Tasks:**
1. Implement player detection (YOLOv8/Detectron2)
2. Set up multi-object tracking (ByteTrack/DeepSORT)
3. Cross-camera player re-identification
4. Jersey number recognition (OCR)

**Tools:**
- YOLOv8 or Detectron2 for object detection
- ByteTrack for player tracking
- EasyOCR for jersey number recognition

### Phase 3: Ground Contact Detection
**Objectives:**
- Detect when players hit the ground
- Classify the type of ground contact event

**Tasks:**
1. Pose estimation to detect player orientation
2. Ground contact classification:
   - Tackle (attacking)
   - Tackle (defending)
   - Ball carry contact
   - Cleanout/ruck
   - Other tackle zone activity
3. Record precise timestamp of ground contact

**Tools:**
- MediaPipe or OpenPose for pose estimation
- Custom ML classifier for event type
- Frame-by-frame analysis

### Phase 4: Recovery Analysis
**Objectives:**
- Measure time from ground to standing
- Classify first movement as RUN or WALK

**Tasks:**
1. Detect when player stands up (T1)
2. Track player movement for next 3-5 meters
3. Calculate movement speed/acceleration
4. Classify as RUN (>threshold) or WALK (<threshold)
5. Determine "back in position" point (T2)

**Metrics:**
- Speed threshold: ~3 m/s for RUN detection
- Distance tracking: 3-5 meter range
- Position analysis: relative to play/formation

**Tools:**
- Optical flow analysis
- Speed calculation from pixel displacement
- Position tracking relative to ball/play

### Phase 5: Data Collection & Analysis
**Objectives:**
- Aggregate all metrics per player
- Generate statistical analysis
- Create output in required format

**Tasks:**
1. Build database schema for events
2. Store per-player, per-event metrics
3. Calculate aggregate statistics
4. Generate visualizations

**Data Structure:**
```json
{
  "player_id": "10",
  "event_timestamp": "12:34.5",
  "event_type": "tackle_defending",
  "ground_contact_time": "12:34.5",
  "stand_up_time": "12:36.2",
  "back_in_position_time": "12:39.0",
  "recovery_time_seconds": 1.7,
  "reposition_time_seconds": 2.8,
  "total_time_seconds": 4.5,
  "movement_type": "RUN",
  "distance_covered_meters": 4.2,
  "average_speed_ms": 1.5,
  "camera_angle": "main"
}
```

### Phase 6: Output Generation
**Objectives:**
- Create comprehensive report
- Visualize player performance
- Export in sample format (TBD - await format specification)

**Tasks:**
1. Per-player summary statistics
2. Event-by-event breakdown
3. Comparative analysis (RUN vs WALK outcomes)
4. Heatmaps showing recovery patterns
5. Export to CSV/JSON/Excel

## Technical Stack

### Core Technologies
- **Language**: Python 3.10+
- **Computer Vision**: OpenCV, MediaPipe
- **ML/AI**: PyTorch, YOLOv8, ByteTrack
- **Video Processing**: FFmpeg, yt-dlp
- **Data Analysis**: Pandas, NumPy
- **Visualization**: Matplotlib, Seaborn, Plotly

### Project Structure
```
rugby-analysis/
├── src/
│   ├── video_processing/
│   │   ├── downloader.py
│   │   ├── synchronizer.py
│   │   └── frame_extractor.py
│   ├── detection/
│   │   ├── player_detector.py
│   │   ├── tracker.py
│   │   └── pose_estimator.py
│   ├── analysis/
│   │   ├── ground_contact.py
│   │   ├── movement_classifier.py
│   │   └── metrics_calculator.py
│   ├── data/
│   │   ├── event_store.py
│   │   └── models.py
│   └── visualization/
│       ├── reporter.py
│       └── plotter.py
├── tests/
│   ├── test_detection.py
│   ├── test_tracking.py
│   └── test_analysis.py
├── config/
│   ├── model_config.yaml
│   └── thresholds.yaml
├── data/
│   ├── raw_videos/
│   ├── processed_frames/
│   └── results/
├── models/
│   └── trained_weights/
└── output/
    ├── reports/
    └── visualizations/
```

## Key Challenges & Solutions

### Challenge 1: Multi-Camera Synchronization
**Solution:** Use audio waveform matching or visual event markers (whistle, ball placement) to sync timelines

### Challenge 2: Player Occlusion
**Solution:** Leverage multiple camera angles to maintain tracking when player is occluded in one view

### Challenge 3: Run vs Walk Classification
**Solution:**
- Calculate speed from pixel displacement + camera calibration
- Use pose analysis to detect running gait patterns
- Set threshold at ~3 m/s for rugby-specific running

### Challenge 4: "Back in Position" Definition
**Solution:**
- Define relative to defensive/attacking line
- Consider proximity to ball carrier
- Account for role-specific positioning

### Challenge 5: Event Type Classification
**Solution:** Train custom classifier on:
- Player pose at contact
- Ball proximity
- Number of players involved
- Contact direction/speed

## Timeline Estimate

| Phase | Duration | Dependencies |
|-------|----------|--------------|
| Phase 1: Video Processing | 2-3 days | None |
| Phase 2: Player Detection | 3-5 days | Phase 1 |
| Phase 3: Ground Contact | 4-6 days | Phase 2 |
| Phase 4: Recovery Analysis | 5-7 days | Phase 3 |
| Phase 5: Data Collection | 2-3 days | Phase 4 |
| Phase 6: Output Generation | 2-3 days | Phase 5 |
| **Total** | **18-27 days** | |

## Success Criteria

1. ✅ All ground contact events detected with >90% accuracy
2. ✅ Player tracking maintains identity through 95%+ of match
3. ✅ RUN vs WALK classification with >85% accuracy
4. ✅ Timing measurements accurate to ±0.1 seconds
5. ✅ Complete dataset exported in required format
6. ✅ Per-player performance metrics generated
7. ✅ Visualization dashboard created

## Next Steps

1. **Immediate Actions:**
   - Confirm output format requirements with colleague
   - Download all 4 video sources
   - Set up Python environment with required packages
   - Review analysis platform framework (attached image - need to locate)

2. **Technical Setup:**
   - Install dependencies (requirements.txt)
   - Configure GPU for ML inference
   - Set up video processing pipeline
   - Initialize data storage

3. **Development Start:**
   - Begin Phase 1 (Video Processing)
   - Test synchronization across 4 angles
   - Validate frame extraction quality

## Notes & Considerations

- **Sample Format:** Still need clarification on exact output format
- **Framework Image:** Referenced analysis platform framework needs to be reviewed
- **Manual Validation:** May need expert review for ground truth labeling
- **Performance:** GPU recommended for real-time processing
- **Scalability:** Design to handle multiple matches in future
