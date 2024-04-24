





#lOAD AND eXPLORE dATASeT
load("Heartrate.RData")

View(Heartrate)
head(Heartrate)
tail(Heartrate)
colnames(Heartrate)

#Renaming "Value" for "BPM"
#library(dplyr)
Heartrate <- Heartrate %>% rename(BPM = Value)

str(Heartrate)
names(Heartrate)
length(Heartrate)
class(Heartrate)
unique(Heartrate)
dim(Heartrate)


#CLEAN "BPM"

#1.- Looking for missing values
sum(is.na(Heartrate$BPM))
colSums(is.na(Heartrate))

#2.- Clean Column Names
janitor::clean_names(Heartrate)

#3.- Convert Data Types
str(Heartrate)
glimpse(Heartrate)

#4.- Handle Duplicates

dplyr::distinct(Heartrate)
unique((Heartrate))

#5.- Fix Structural Errors
#6.- Standarize values
#7.- Handle Outliers
boxplot.stats(Heartrate$BPM)
stats <- boxplot.stats(Heartrate$BPM)

#CREATED A NEW DATA FRAME WITHOUT THE OUTLIERS 

outliers <- Heartrate$BPM[Heartrate$BPM %in% stats$out]
Heartrate$BPM[Heartrate$BPM %in% outliers] <- NA
Heartrate_without_outliers <- Heartrate[!Heartrate$BPM %in% outliers, ]
View(Heartrate_without_outliers)
#save(Heartrate_without_outliers, file = "Heartrate_without_outliers.RData")



#VERIFY DATA IN NEW DF

#2.- Clean Column Names
janitor::clean_names(Heartrate_without_outliers)

#3.- Convert Data Types
str(Heartrate_without_outliers)
glimpse(Heartrate_without_outliers)

#4.- Handle Duplicates

dplyr::distinct(Heartrate_without_outliers)
unique((Heartrate_without_outliers))
View(Heartrate_without_outliers)
dim(Heartrate_without_outliers)

Clean_Heartrate <- Heartrate_without_outliers %>% drop_na()
View(Clean_Heartrate)
str(Clean_Heartrate)
dim(Clean_Heartrate)

save(Clean_Heartrate, file = "Clean_Heartrate.RData")

Clean_Heartrate %>%
  select(BPM) %>%
  summary()