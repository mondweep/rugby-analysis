```python
def predict_injury_risk(player_data: dict) -> float:
    # Calculate risk score 0-100
    # Use player_data keys: age, training_load, injury_history
    
    age = player_data.get('age', 0)
    training_load = player_data.get('training_load', 0)
    injury_history = player_data.get('injury_history', 0)
    
    # Base risk increases with age (after 25)
    age_risk = max(0, (age - 25) * 1.5) if age > 25 else 0
    
    # Training load contributes to risk (higher load = higher risk)
    load_risk = min(training_load * 0.5, 50)
    
    # Previous injuries increase risk
    history_risk = injury_history * 10
    
    # Combine factors with weights
    risk_score = min(100, (age_risk * 0.3) + (load_risk * 0.5) + (history_risk * 0.2))
    
    return round(risk_score, 2)
```
