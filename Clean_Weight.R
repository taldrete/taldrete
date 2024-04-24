#Load and explore dataset

load("Weight.Rdata")


dim(Weight)
View(Weight)
names(Weight)
colnames(Weight)
str(Weight)
length(Weight)
class(Weight)
unique(Weight)
head(Weight)
tail(Weight)


#CLEAN "WeightKg"

#1.- Looking for missing values
sum(is.na(Weight$WeightKg))
colSums(is.na(Weight))

#2.- Clean Column Names
janitor::clean_names(Weight)

#3.- Convert Data Types
str(Weight)
glimpse(Weight)

#4.- Handle Duplicates

dplyr::distinct(Weight)
unique((Weight))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Weight$WeightKg)
stats <- boxplot.stats(Weight$WeightKg)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Weight$WeightKg[Weight$WeightKg %in% stats$out]
Weight$WeightKg[Weight$WeightKg %in% outliers] <- NA
Weight_without_outliers <- Weight[!Weight$WeightKg %in% outliers, ]
View(Weight_without_outliers)
#save(Weight_without_outliers, file = "Weight_without_outliers.RData")


#CLEAN "WeightPounds"

#1.- Looking for missing values
sum(is.na(Weight$WeightPounds))
colSums(is.na(Weight))


#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Weight$WeightPounds)
stats <- boxplot.stats(Weight$WeightPounds)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Weight$WeightPounds[Weight$WeightPounds %in% stats$out]
Weight$WeightPounds[Weight$WeightPounds %in% outliers] <- NA
Weight_without_outliers <- Weight[!Weight$WeightPounds %in% outliers, ]
View(Weight_without_outliers)
#save(Weight_without_outliers, file = "Weight_without_outliers.RData")

#clean BMI
#Change name BMI to BodyMassIndex

Weight <- Weight %>% rename(BodyMassIndex = BMI)
View(Weight)

sum(is.na(Weight$BodyMassIndex))
colSums(is.na(Weight))

boxplot.stats(Weight$BodyMassIndex)
stats <- boxplot.stats(Weight$BodyMassIndex)

outliers <- Weight$BodyMassIndex[Weight$BodyMassIndex %in% stats$out]
Weight$BodyMassIndex[Weight$BodyMassIndex %in% outliers] <- NA
Weight_without_outliers <- Weight[!Weight$BodyMassIndex %in% outliers, ]
View(Weight_without_outliers)
#save(Weight_without_outliers, file = "Weight_without_outliers.RData")


#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Weight_without_outliers)

#3.- Convert Data Types
str(Weight_without_outliers)
glimpse(Weight_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Weight_without_outliers)
unique((Weight_without_outliers))
View(Weight_without_outliers)
dim(Weight_without_outliers)

Clean_Weight <- Weight_without_outliers %>% drop_na()
View(Clean_Weight)
str(Clean_Weight)
dim(Clean_Weight)

save(Clean_Weight, file = "Clean_Weight.RData")

#Weight
Clean_Weight %>%
  select(WeightKg, WeightPounds, BodyMassIndex) %>%
  summary()

