



#lOAD AND eXPLORE dATASeT
load("Intensities.RData")

View(Intensities)
head(Intensities)
tail(Intensities)
colnames(Intensities)
str(Intensities)
names(Intensities)
length(Intensities)
class(Intensities)
unique(Intensities)
dim(Intensities)


#CLEAN "SedentaryMinutes"

#1.- Looking for missing values
sum(is.na(Intensities$SedentaryMinutes))
colSums(is.na(Intensities))

#2.- Clean Column Names
janitor::clean_names(Intensities)

#3.- Convert Data Types
str(Intensities)
glimpse(Intensities)

#4.- Handle Duplicates

dplyr::distinct(Intensities)
unique((Intensities))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Intensities$SedentaryMinutes)
stats <- boxplot.stats(Intensities$SedentaryMinutes)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Intensities$SedentaryMinutes[Intensities$SedentaryMinutes %in% stats$out]
Intensities$SedentaryMinutes[Intensities$SedentaryMinutes %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$SedentaryMinutes %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")



#Clean "LightlyActiveMinutes"
#1.- Looking for missing values
sum(is.na(Intensities$LightlyActiveMinutes))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$LightlyActiveMinutes)
stats <- boxplot.stats(Intensities$LightlyActiveMinutes)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$LightlyActiveMinutes[Intensities$LightlyActiveMinutes %in% stats$out]
Intensities$LightlyActiveMinutes[Intensities$LightlyActiveMinutes %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$LightlyActiveMinutes %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")


#Clean "LightlyActiveMinutes"
#1.- Looking for missing values
sum(is.na(Intensities$LightlyActiveMinutes))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$LightlyActiveMinutes)
stats <- boxplot.stats(Intensities$LightlyActiveMinutes)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$LightlyActiveMinutes[Intensities$LightlyActiveMinutes %in% stats$out]
Intensities$LightlyActiveMinutes[Intensities$LightlyActiveMinutes %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$LightlyActiveMinutes %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")


#Clean "FairlyActiveMinutes"
#1.- Looking for missing values
sum(is.na(Intensities$FairlyActiveMinutes))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$FairlyActiveMinutes)
stats <- boxplot.stats(Intensities$FairlyActiveMinutes)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$FairlyActiveMinutes[Intensities$FairlyActiveMinutes %in% stats$out]
Intensities$FairlyActiveMinutes[Intensities$FairlyActiveMinutes %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$FairlyActiveMinutes %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")



#Clean "VeryActiveMinutes"
#1.- Looking for missing values
sum(is.na(Intensities$VeryActiveMinutes))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$VeryActiveMinutes)
stats <- boxplot.stats(Intensities$VeryActiveMinutes)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$VeryActiveMinutes[Intensities$VeryActiveMinutes %in% stats$out]
Intensities$VeryActiveMinutes[Intensities$VeryActiveMinutes %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$VeryActiveMinutes %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")



#Clean "LightActiveDistance"
#1.- Looking for missing values
sum(is.na(Intensities$LightActiveDistance))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$LightActiveDistance)
stats <- boxplot.stats(Intensities$LightActiveDistance)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$LightActiveDistance[Intensities$LightActiveDistance %in% stats$out]
Intensities$LightActiveDistance[Intensities$LightActiveDistance %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$LightActiveDistance %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")


#Clean "ModeratelyActiveDistance"
#1.- Looking for missing values
sum(is.na(Intensities$ModeratelyActiveDistance))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$ModeratelyActiveDistance)
stats <- boxplot.stats(Intensities$ModeratelyActiveDistance)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$ModeratelyActiveDistance[Intensities$ModeratelyActiveDistance %in% stats$out]
Intensities$ModeratelyActiveDistance[Intensities$ModeratelyActiveDistance %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$ModeratelyActiveDistance %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")


#Clean "VeryActiveDistance"
#1.- Looking for missing values
sum(is.na(Intensities$VeryActiveDistance))
colSums(is.na(Intensities))

#Handle Outliers
boxplot.stats(Intensities$VeryActiveDistance)
stats <- boxplot.stats(Intensities$VeryActiveDistance)

#REMOVE OUTLIERS OBSERVATIONS FROM DF

outliers <- Intensities$VeryActiveDistance[Intensities$VeryActiveDistance %in% stats$out]
Intensities$VeryActiveDistance[Intensities$VeryActiveDistance %in% outliers] <- NA
Intensities_without_outliers <- Intensities[!Intensities$VeryActiveDistance %in% outliers, ]
View(Intensities_without_outliers)
#save(Intensities_without_outliers, file = "Intensities_without_outliers.RData")

#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Intensities_without_outliers)

#3.- Convert Data Types
str(Intensities_without_outliers)
glimpse(Intensities_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Intensities_without_outliers)
unique((Intensities_without_outliers))
View(Intensities_without_outliers)
dim(Intensities_without_outliers)

Clean_Intensities <- Intensities_without_outliers %>% drop_na()
View(Clean_Intensities)
str(Clean_Intensities)
dim(Clean_Intensities)

save(Clean_Intensities, file = "Clean_Intensities.RData")

Clean_Intensities %>%
  select(SedentaryMinutes, LightlyActiveMinutes, FairlyActiveMinutes, VeryActiveMinutes, LightActiveDistance, ModeratelyActiveDistance, VeryActiveDistance) %>%
  summary()
