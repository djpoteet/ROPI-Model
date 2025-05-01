# ROPI Model (Return on Player Investment)

This project introduces a data-driven model for evaluating player value in Major League Baseball. The ROPI (Return on Player Investment) model adjusts traditional WAR-based valuation by incorporating organizational context, player risk, and strategic timing that can help front offices make more informed, efficient roster decisions.

## What It Does

ROPI estimates how much on-field value a player will generate **relative to their cost**, adjusted for:
- **Team Development Edge**: Does this player fit the strengths of your organization?
- **Scouting Confidence**: How reliable is the projection?
- **Timing**: Is your team contending or rebuilding?
- **Variance Risk**: How volatile is the player's performance or injury history?

The result is a clean, risk-adjusted value score:  
> `ROPI Score = Adjusted WAR / Adjusted Cost`

## How to Use It

- Open the `ropi_model.R` script
- Run the `calculate_ROPI()` function with your inputs
- Compare ROPI scores across players to find who is undervalued or overpriced 
- Visualize results using the included `ggplot2` example

## Why It Matters

This model helps teams:
- Prioritize player extensions
- Evaluate free agent risk vs reward
- Align payroll decisions with competitive windows
- Make scouting insights measurable

## Example Use Cases

- Jordan Westburg: 3.15 WAR at $1.8M cost → ROPI = 1.75 (elite efficiency)
- Blake Snell: 3.19 WAR at $37.8M cost → ROPI = 0.08 (high cost, low return)

---

Built in **R**.  
Visualization powered by **ggplot2**.  
All estimates are illustrative. WAR values sourced from FanGraphs (Steamer/Depth Charts).
