load("Clean_Steps.RData")
load("Clean_Heartrate.RData")
dim(Clean_Steps)
dim(Clean_Heartrate)

dplyr::distinct(Clean_Heartrate)
unique(Clean_Heartrate)
tail(Clean_Heartrate)

sorted_df <- Clean_Heartrate[order(Clean_Heartrate$Id), ]

duplicates <- duplicated(Clean_Heartrate[, c("Id", "BPM")])
df_unique <- Clean_Heartrate[!duplicates, ]
dim(df_unique)
dim(Clean_Steps)


View(Steps_vs_Heartrate)


sum(is.na(Steps_vs_Heartrate$TotalSteps))
sum(is.na(Steps_vs_Heartrate$BPM))
colSums(is.na(Steps_vs_Heartrate))

dplyr::distinct(Steps_vs_Heartrate)
unique((Steps_vs_Heartrate))


#Merge

Steps_vs_Heartrate <- merge(x = Clean_Steps, y = df_unique, by = "Id")


str(Steps_vs_Heartrate)


df_unique_clean <- distinct(Steps_vs_Heartrate, Id, ActivityDay, .keep_all = TRUE)
View(df_unique_clean)                      
dim(df_unique_clean)



boxplot.stats(df_unique_clean$TotalSteps)
boxplot.stats(df_unique_clean$BPM)


#Smooth Line scatter plot
ggplot(df_unique_clean, aes(x = BPM, y = TotalSteps)) + 
  geom_point() +
  geom_smooth(method = "loess") 



#Line Plot
ggplot(df_unique_clean, aes(x = TotalSteps, y = BPM, color = BPM)) +
  geom_line() +
  scale_color_gradient(low = "red", high = "gold", name = "BPM") +
  labs(title = "Steps vs Heartrate",x = "Total Steps", y = "BPM", color = "BPM")