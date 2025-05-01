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

## Let’s Walk Through How We Got The Values

1. Team Edge Adjustment = 1.05 (aka +5%)

What it means: How much a team is likely to improve (or hurt) a player's performance based on coaching, player dev, and role fit.

Why +5% for Westburg?
  - We assumed an average org (not the Orioles).

Jordan Westburg is:
  - Athletic
  - Versatile
  - Adjustable
  - Pretty much developed

Most teams wouldn’t drastically improve or ruin him so a small +5% bump felt reasonable.

If this were the Dodgers or Rays (great development organizations), you might input +10 to +15%.

If it were a struggling org with a poor track record developing hitters/infielders, you might use 0.95 or 0.9 (–5 to -10%).


Rule of thumb for this input:
  - Use historical org-specific performance in similar player types to estimate.

Assign:
  - 1.00 = neutral
  - Greater than 1.00 = org improves these players
  - Less than 1.00 = org underperforms

2. Scouting Confidence = 1.00 (aka 100%)

What it means: How certain you are about the projection mainly used for prospects or players without a long MLB track record.

Why 100% for Westburg?
  - He has now played over 175 MLB games.
  - His metrics (BB%, K%, ISO) are pretty stable.
  - He’s no longer purely “projection-based”.
  - So we treat him like a known quantity → no need to adjust the WAR up or down for confidence.

Rule of thumb for this input:
  - 1.00 = high confidence (established MLB players)
  - Greater than 1.00 = extremely strong internal conviction (e.g., elite makeup + org has internal development info)
  - Less than 1.00 = low confidence (boom/bust prospect)

3. Timing Multiplier = 1.2

What it means: How valuable a win is to you right now based on where you are in the competitive cycle.

Why 1.2 for Westburg?
  - We assumed the Orioles are in a playoff push or contending window.
  - As discussed earlier, wins are much more valuable at 85–95 wins than at 70.
  - We used 1.2x multiplier to reflect the increased value of his 2.5 WAR in that context.

Rule of thumb for this input:
  - 1.00 = End of rebuild or neutral team
  - 1.1–1.3 = Competing now (value of marginal win is high)
  - 0.8–0.9 = Tanking/long-term rebuild

4. Opportunity Cost = $1M

What it means: Any non-salary cost associated with using a roster spot on this player — including blocking a prospect, using a 40-man spot, reducing flexibility.

Why $1M for Westburg?
  - He’s a versatile infielder who enhances flexibility, not restricts it.
  - He doesn’t burn option years or block elite prospects right now.

But still, any roster spot has a value → especially if you're choosing him over someone else.

$1M is a soft default for “low opportunity cost” players. Could go up if he were blocking a top prospect or out of options.


Rule of thumb for this input:
  - $0.5M–$1M = Low opportunity cost
  - $2M+ = Blocking valuable player, out of options, limited roster fit
  - Could also scale based on 40-man, options, trade value

5. Variance Penalty = 1.0

What it means: The risk factor of how likely a player is to swing dramatically up or down from projections.

Why 1.0 for Westburg?
  - Good plate discipline
  - Solid contact and power
  - No massive splits or glaring red flags
  - He’s young and has been fairly consistent so far → low risk profile

So we used 1.0, meaning no penalty. For a player with a long history of injuries, or who depends on volatile tools (like walk rate or extreme platoon splits), we might use 1.1–1.3.

Rule of thumb for this input:
  - 1.0 = Low variance (high floor players)
  - 1.1–1.3 = High variance (injury-prone, K-prone, one-dimensional tools)
  - You could use standard deviation of past WAR as a proxy here in R


---

Built in **R**.  
Visualization powered by **ggplot2**.  
All estimates are illustrative. WAR values sourced from FanGraphs (Steamer/Depth Charts).
