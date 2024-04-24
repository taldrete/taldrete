#Loading and Exploring Datasets
load("Clean_Activity.RData")
load("Clean_Intensities.RData")

View(Clean_Activity)
View(Clean_Intensities)

dim(Clean_Activity)
dim(Clean_Intensities)

dplyr::distinct(Clean_Activity)
unique(Clean_Activity)

dplyr::distinct(Clean_Intensities)
unique(Clean_Intensities)

colSums(is.na(Clean_Activity))
colSums(is.na(Clean_Intensities))

str(Clean_Activity)
str(Clean_Intensities)

#Manipulating duplicates

sorted_df <- Clean_Activity[order(Clean_Activity$Id), ]

duplicates <- duplicated(Clean_Activity[, c("Id", "TotalSteps")])
unique_Activity <- Clean_Activity[!duplicates, ]

dim(unique_Activity)
View(unique_Activity)

sorted_df <- Clean_Intensities[order(Clean_Intensities$Id), ]

duplicates <- duplicated(Clean_Intensities[, c("Id", "ActivityDay")])
unique_Intensities <- Clean_Intensities[!duplicates, ]

dim(Clean_Intensities)
View(Clean_Intensities)

#Merge

Intense_Activity <- merge(x = unique_Activity, y = unique_Intensities, by = "Id")

dim(Intense_Activity)
View(Intense_Activity)

df_Intense_Activity_unique_clean <- distinct(Intense_Activity, Id, ActivityDay, .keep_all = TRUE)
View(df_Intense_Activity_unique_clean)
dim(df_Intense_Activity_unique_clean)

#Explore and Clean Merged

colSums(is.na(df_Intense_Activity_unique_clean))

dplyr::distinct(df_Intense_Activity_unique_clean)
unique(df_Intense_Activity_unique_clean)

Intense_Activity_Clean <- df_Intense_Activity_unique_clean[!duplicates, ]

dim(Intense_Activity_Clean)
View(Intense_Activity_Clean)

#looking for outliers
boxplot.stats(Intense_Activity_Clean$TotalSteps)
boxplot.stats(Intense_Activity_Clean$VeryActiveDistance.x)
stats <- boxplot.stats(Intense_Activity_Clean$VeryActiveDistance.x)
boxplot.stats(Intense_Activity_Clean$VeryActiveMinutes.x)

#removing outliers
outliers <- Intense_Activity_Clean$VeryActiveDistance.x[Intense_Activity_Clean$VeryActiveDistance.x %in% stats$out]
Intense_Activity_Clean$VeryActiveDistance.x[Intense_Activity_Clean$VeryActiveDistance.x %in% outliers] <- NA
VeryActiveDistance_without_outliers <- Intense_Activity_Clean[!Intense_Activity_Clean$VeryActiveDistance.x %in% outliers, ]
View(VeryActiveDistance_without_outliers)

boxplot.stats(VeryActiveDistance_without_outliers$VeryActiveDistance.x)

#Visualization
ggplot(Intense_Activity_Clean, aes(x = VeryActiveDistance.y, y = VeryActiveMinutes.y, size = TotalSteps, color = "Steps")) + 
  geom_point() +
  geom_smooth(method = "loess", aes(color = "Smooth Line")) +
  labs(title = "Distance and Active Time vs Steps", x = "Active Distance (miles)", y = "Active Times (minutes)", color = "Steps")


ggplot(Intense_Activity_Clean, aes(x = TotalSteps, y = Calories, color = TotalDistance)) +
  geom_point() +
  labs(title ="Calories & Distance", x = "Total Steps", y = "Calories", color = "Total Distance")