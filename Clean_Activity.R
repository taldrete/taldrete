#LOADING PACKAGES AND LIBRARIES

#iNSTALL PACKAGES 

install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("Rtools")
install.packages("tidyr")
install.packages("skimr")
install.packages("janitor")

#LOAD LIBRARY

library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)

library(tidyr)
library(skimr)
library(janitor)

#lOAD AND eXPLORE dATASeT
load("Activity.RData")

View(Activity)
head(Activity)
tail(Activity)
colnames(Activity)
str(Activity)
names(Activity)
length(Activity)
class(Activity)
unique(Activity)
dim(Activity)

#Id and ActivityDate values are inconsequential for the purpose of our task
#CLEAN "TotalSteps"

#1.- Looking for missing values
sum(is.na(Activity$TotalSteps))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$TotalSteps)
stats <- boxplot.stats(Activity$TotalSteps)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS (created a new column called Clean_Total_Steps and  a ne df Activity_without_outliers)

Clean_TotalSteps <- Activity$TotalSteps[Activity$TotalSteps %in% stats$out]
Activity$TotalSteps[Activity$TotalSteps %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$TotalSteps %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN TOTALDISTANCE

#1.- Looking for missing values
sum(is.na(Activity$TotalDistance))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$TotalDistance)
stats <- boxplot.stats(Activity$TotalDistance)
Clean_TotalSteps <- Activity$TotalDistance[Activity$TotalDistance %in% stats$out]
Activity$TotalDistance[Activity$TotalDistance %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$TotalDistance %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")


#CLEAN TRACKER DISTANCE
#1.- Looking for missing values
sum(is.na(Activity_without_outliers$TrackerDistance))
colSums(is.na(Activity_without_outliers))


#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$TrackerDistance)
stats <- boxplot.stats(Activity$TrackerDistance)
Clean_TotalSteps <- Activity$TrackerDistance[Activity$TrackerDistance %in% stats$out]
Activity$TrackerDistance[Activity$TrackerDistance %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$TrackerDistance %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN VERYACTIVEDISTANCE
#1.- Looking for missing values
sum(is.na(Activity$VeryActiveDistance))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$VeryActiveDistance)
stats <- boxplot.stats(Activity$VeryActiveDistance)
Clean_TotalSteps <- Activity$VeryActiveDistance[Activity$VeryActiveDistance %in% stats$out]
Activity$VeryActiveDistance[Activity$VeryActiveDistance %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$VeryActiveDistance %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN MODERATELYACTIVEDISTANCE
#1.- Looking for missing values
sum(is.na(Activity$ModeratelyActiveDistance))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$ModeratelyActiveDistance)
stats <- boxplot.stats(Activity$ModeratelyActiveDistance)
Clean_TotalSteps <- Activity$ModeratelyActiveDistance[Activity$ModeratelyActiveDistance %in% stats$out]
Activity$ModeratelyActiveDistance[Activity$ModeratelyActiveDistance %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$ModeratelyActiveDistance %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN LIGHTACTIVEDISTANCE
#1.- Looking for missing values
sum(is.na(Activity$LightActiveDistance))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$LightActiveDistance)
stats <- boxplot.stats(Activity$LightActiveDistance)
Clean_TotalSteps <- Activity$LightActiveDistance[Activity$LightActiveDistance %in% stats$out]
Activity$LightActiveDistance[Activity$LightActiveDistance %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$LightActiveDistance %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN VERYACTIVEMINUTES
#1.- Looking for missing values
sum(is.na(Activity$VeryActiveMinutes))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$VeryActiveMinutes)
stats <- boxplot.stats(Activity$VeryActiveMinutes)
Clean_TotalSteps <- Activity$VeryActiveMinutes[Activity$VeryActiveMinutes %in% stats$out]
Activity$VeryActiveMinutes[Activity$VeryActiveMinutes %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$VeryActiveMinutes %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN FAIRLYACTIVEMINUTES
#1.- Looking for missing values
sum(is.na(Activity$FairlyActiveMinutes))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$FairlyActiveMinutes)
stats <- boxplot.stats(Activity$FairlyActiveMinutes)
Clean_TotalSteps <- Activity$FairlyActiveMinutes[Activity$FairlyActiveMinutes %in% stats$out]
Activity$FairlyActiveMinutes[Activity$FairlyActiveMinutes %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$FairlyActiveMinutes %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN LIGHTLYACTIVEMINUTES
#1.- Looking for missing values
sum(is.na(Activity$LightlyActiveMinutes))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$LightlyActiveMinutes)
stats <- boxplot.stats(Activity$LightlyActiveMinutes)
Clean_TotalSteps <- Activity$LightlyActiveMinutes[Activity$LightlyActiveMinutes %in% stats$out]
Activity$LightlyActiveMinutes[Activity$LightlyActiveMinutes %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$LightlyActiveMinutes %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN SEDENTARYMINUTES

#1.- Looking for missing values
sum(is.na(Activity$SedentaryMinutes))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$SedentaryMinutes)
stats <- boxplot.stats(Activity$SedentaryMinutes)
Clean_TotalSteps <- Activity$SedentaryMinutes[Activity$SedentaryMinutes %in% stats$out]
Activity$SedentaryMinutes[Activity$SedentaryMinutes %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$SedentaryMinutes %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")

#CLEAN CALORIES

#1.- Looking for missing values
sum(is.na(Activity$Calories))
colSums(is.na(Activity))

#2.- Clean Column Names
janitor::clean_names(Activity)

#3.- Convert Data Types
str(Activity)
glimpse(Activity)

#4.- Handle Duplicates

dplyr::distinct(Activity)
unique((Activity))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Activity$Calories)
stats <- boxplot.stats(Activity$Calories)
Clean_TotalSteps <- Activity$Calories[Activity$Calories %in% stats$out]
Activity$Calories[Activity$Calories %in% Clean_TotalSteps] <- NA
Activity_without_outliers <- Activity[!Activity$Calories %in% Clean_TotalSteps, ]
View(Activity_without_outliers)
#save(Activity_without_outliers, file = "Activity_without_outliers.RData")


#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Activity_without_outliers)

#3.- Convert Data Types
str(Activity_without_outliers)
glimpse(Activity_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Activity_without_outliers)
unique((Activity_without_outliers))
View(Activity_without_outliers)
dim(Activity_without_outliers)

Clean_Activity <- Activity_without_outliers %>% drop_na()
View(Clean_Activity)
str(Clean_Activity)
dim(Clean_Activity)

save(Clean_Activity, file = "Clean_Activity.RData")


Clean_Activity %>%  
  select(TotalDistance, LightlyActiveMinutes,
         SedentaryMinutes, Calories) %>%
  summary()