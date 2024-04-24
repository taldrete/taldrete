data_insights <- data.frame(
  Distance = c(2.26, 4.43, 6.615),
  Active_Minutes = c(114.5, 191.5, 272),
  Steps = c(3760, 7428, 10621),
  Calories = c(1836, 2304, 2783),
  Weight_Pounds = c(135.4, 156.6, 187.2),
  Body_Mass_Index = c(23.96, 24.85, 25.56),
  Beats_per_Minute = c(63, 75.63, 86)
)





write.csv(data_insights, "output.csv", row.names = FALSE)


View(data_insights)
str(data_insights)

library(ggplot2)

# Reshape data for stacked area chart
library(tidyr)
data_insights_long <- gather(data_insights, key = "Metric", value = "Value", -Distance)
View(data_insights_long)
# Create stacked area chart
ggplot(data_insights_long, aes(x = Distance, y = Value, fill = Metric)) +
  geom_area() +
  labs(title = "Stacked Area Chart",
       x = "Distance",
       y = "Value") +
  theme_minimal()

ggplot(data_insights, aes(x = Weight_Pounds, y = Body_Mass_Index, size = Calories, color = Beats_per_Minute)) +
  geom_point(alpha = 0.6) +
  scale_size_continuous(range = c(3, 10)) +
  labs(title = "Bubble Chart",
       x = "Weight (Pounds)",
       y = "Body Mass Index",
       size = "Calories",
       color = "Beats per Minute") +
  theme_minimal()

plot_list <- lapply(data_insights, function(variable) {
  ggplot(data_insights, aes(x = variable)) +
    geom_density(fill = "skyblue", alpha = 0.5) +
    labs(title = paste("Density Plot of", names(variable)))
})

# Display the plots
plot_list

#Distance
#Active_Minutes
#Steps
#Calories
#Weight_Pounds
#Body_Mass_Index
#$Beats_per_Minute

plot_list <- lapply(data_insights, function(Distance) {
  ggplot(data_insights, aes(x = Distance)) +
    geom_density(fill = "red", alpha = 0.5) +
    labs(title = paste("Density Plot of", names(Distance)))
})

library(tidyr)
data_insights_long <- gather(data_insights, key = "Variable", value = "Value")

# Create connected scatter plot
ggplot(data_insights_long, aes(x = Variable, y = Value, group = 1)) +
  geom_line() +
  geom_point() +
  labs(title = "Connected Scatter Plot of Data Insights",
       x = "Variable",
       y = "Value") +
  theme(axis.text.x = element_text(angle = 75, hjust = 1))
  
  theme_minimal()
  
  
# Create a dataframe with the provided data
  # Define variables
  x <- c("Distance", "Active_Minutes", "Steps", "Calories", "Weight_Pounds", "Body_Mass_Index", "Beats_per_Minute")
  y <- list(c(2.26, 4.43, 6.615), c(114.5, 191.5, 272.0), c(3760, 7428, 10621), c(1836, 2304, 2783), c(135.4, 156.6, 187.2), c(23.96, 24.85, 25.56), c(63.00, 75.63, 86))
  
  # Determine the number of repetitions based on the length of the 'y' list
  n <- length(y)
  
  # Create the dataframe
  data <- data.frame(Group = rep(c("Group 1", "Group 2"), each = n), 
                     Variable = rep(x, each = n), 
                     Value = unlist(y))
  
  # Create the boxplot
  library(ggplot2)
  p <- ggplot(data, aes(x = Variable, y = Value)) +
    geom_boxplot() +
    labs(title = "Boxplot of Data Insights", 
         x = "Variable",
         y = "Value") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  
  # Print the plot
  print(p)
  