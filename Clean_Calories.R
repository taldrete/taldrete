#Load and Explore Dataset


load("Calories.RData")
View(Calories)
head(Calories)
tail(Calories)
colnames(Calories)
str(Calories)
names(Calories)
length(Calories)
class(Calories)
unique(Calories)
dim(Calories)

#Looking for missing Values
#1.- Looking for missing values
sum(is.na(Calories$Calories))
colSums(is.na(Calories))

#2.- Clean Column Names
janitor::clean_names(Calories)

#3.- Convert Data Types
str(Calories)
glimpse(Calories)

#4.- Handle Duplicates

dplyr::distinct(Calories)
unique((Calories))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Calories$Calories)
stats <- boxplot.stats(Calories$Calories)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Calories$Calories[Calories$Calories %in% stats$out]
Calories$Calories[Calories$Calories %in% outliers] <- NA
Calories_without_outliers <- Calories[!Calories$Calories %in% outliers, ]
View(Calories_without_outliers)
#save(Calories_without_outliers, file = "Calories_without_outliers.RData")

#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Calories_without_outliers)

#3.- Convert Data Types
str(Calories_without_outliers)
glimpse(Calories_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Calories_without_outliers)
unique((Calories_without_outliers))
View(Calories_without_outliers)
dim(Calories_without_outliers)

Clean_Calories <- Calories_without_outliers %>% drop_na()
View(Clean_Calories)
str(Clean_Calories)
dim(Clean_Calories)

#save(Clean_Calories, file = "Clean_Calories.RData")

#Calories
Clean_Calories %>%
  select(Calories) %>%
  summary()
