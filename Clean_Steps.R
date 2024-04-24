
#lOAD AND eXPLORE dATASeT

load("Steps.RData")

View(Steps)
head(Steps)
tail(Steps)
colnames(Steps)

#Renaming "StepTotal" for "TotalSteps"
#library(dplyr)
Steps <- Steps %>% rename(TotalSteps = StepTotal)

str(Steps)
names(Steps)
length(Steps)
class(Steps)
unique(Steps)
dim(Steps)


#CLEAN "TotalSteps"

#1.- Looking for missing values
sum(is.na(Steps$TotalSteps))
colSums(is.na(Steps))

#2.- Clean Column Names
janitor::clean_names(Steps)

#3.- Convert Data Types
str(Steps)
glimpse(Steps)

#4.- Handle Duplicates

dplyr::distinct(Steps)
unique((Steps))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Steps$TotalSteps)
stats <- boxplot.stats(Steps$TotalSteps)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Steps$TotalSteps[Steps$TotalSteps %in% stats$out]
Steps$TotalSteps[Steps$TotalSteps %in% outliers] <- NA
Steps_without_outliers <- Steps[!Steps$TotalSteps %in% outliers, ]
View(Steps_without_outliers)
#save(Steps_without_outliers, file = "Steps_without_outliers.RData")



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

Clean_Steps %>%
  select(TotalSteps) %>%
  summary()