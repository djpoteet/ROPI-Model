# Load required libraries
library(ggplot2)

# ROPI Function: Return on Player Investment
calculate_ROPI <- function(
    projected_war,           
    team_edge = 1.00,        
    scouting_confidence = 1.00, 
    timing_multiplier = 1.00,   
    salary_millions,         
    opportunity_cost = 0,    
    variance_penalty = 1.00  
) {
  # Step 1: Adjust WAR
  adjusted_war <- projected_war * team_edge * scouting_confidence * timing_multiplier
  
  # Step 2: Adjust Cost
  adjusted_cost <- (salary_millions + opportunity_cost) * variance_penalty
  
  # Step 3: ROPI Score
  ropi_score <- adjusted_war / adjusted_cost
  
  # Step 4: Return output as list
  return(list(
    Adjusted_WAR = round(adjusted_war, 2),
    Adjusted_Cost = round(adjusted_cost, 2),
    ROPI_Score = round(ropi_score, 2)
  ))
}

# Create a data frame for visualization
westburg_data <- data.frame(
  Metric = c("Adjusted WAR", "Adjusted Cost"),
  Value = c(3.15, 1.8)
)
# Bar chart using ggplot2
ggplot(westburg_data, aes(x = Metric, y = Value, fill = Metric)) +
  geom_bar(stat = "identity", width = 0.6) +
  labs(title = "Jordan Westburg: Adjusted WAR vs Adjusted Cost",
       y = "Value (WAR or $M)", x = "") +
  theme_minimal() +
  theme(legend.position = "none")

# Example: Jordan Westburg
calculate_ROPI(
  projected_war = 2.5,
  team_edge = 1.05,
  scouting_confidence = 1.00,
  timing_multiplier = 1.2,
  salary_millions = 0.8,
  opportunity_cost = 1.0,
  variance_penalty = 1.0
)

# Example: Blake Snell
calculate_ROPI(
  projected_war = 2.8,
  team_edge = 1.00,
  scouting_confidence = 0.95,
  timing_multiplier = 1.2,
  salary_millions = 30.0,
  opportunity_cost = 1.5,
  variance_penalty = 1.2
)

# Manually enter Adjusted WAR and Adjusted Cost for both players
ropi_data <- data.frame(
  Player = c("Jordan Westburg", "Jordan Westburg", "Blake Snell", "Blake Snell"),
  Metric = c("Adjusted WAR", "Adjusted Cost", "Adjusted WAR", "Adjusted Cost"),
  Value = c(3.15, 1.8, 3.19, 37.8)
)
# Side-by-side bar chart comparing players
ggplot(ropi_data, aes(x = Metric, y = Value, fill = Player)) +
  geom_bar(stat = "identity", position = "dodge", width = 0.6) +
  labs(
    title = "ROPI Comparison: Jordan Westburg vs Blake Snell",
    x = "",
    y = "Value (WAR or $M)"
  ) +
  theme_minimal()
