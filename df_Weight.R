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

Weight <- Weight %>% rename(BodyMassIndex = bmi)
View(Weight)




#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Steps_without_outliers)

#3.- Convert Data Types
str(Steps_without_outliers)
glimpse(Steps_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Steps_without_outliers)
unique((Steps_without_outliers))
View(Steps_without_outliers)
dim(Steps_without_outliers)

Clean_Steps <- Steps_without_outliers %>% drop_na()
View(Clean_Steps)
str(Clean_Steps)
dim(Clean_Steps)

save(Clean_Steps, file = "Clean_Steps.RData")
