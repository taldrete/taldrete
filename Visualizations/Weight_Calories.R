
#merged_df <- merge(x = dataframe1, y = dataframe2, by = "common_column")
load("Clean_Weight.RData")
load("Clean_Calories.RData")

install.packages("ggthemes")
library(ggthemes)
ls(getNamespace("ggthemes"), all.names=TRUE)

View(Clean_Weight)
View(Clean_Calories)


Weight_vs_Calories <- merge(x = Clean_Weight, y = Clean_Calories, by = "Id")

View(Weight_vs_Calories)

dim(Weight_vs_Calories)
str(Weight_vs_Calories)
glimpse(Weight_vs_Calories)

sum(is.na(Weight_vs_Calories$WeightPounds))
colSums(is.na(Weight_vs_Calories))

boxplot.stats(Weight_vs_Calories$WeightPounds)
boxplot.stats(Weight_vs_Calories$BodyMassIndex)
boxplot.stats(Weight_vs_Calories$Calories)


library(ggplot2)
#Multi-Line Chart
ggplot(Weight_vs_Calories, aes(x = Calories, y = weight_pounds, color = BodyMassIndex)) +
  geom_line() +
  labs(title = "Calories, Weight, and Body Mass", 
       x = "Calories", 
       y = "Weight in Pounds",
       color = "Body Mass Index") +
  theme_minimal()

#stacked
library(ggplot2)

ggplot(Weight_vs_Calories, aes(x = weight_pounds, y = BodyMassIndex, fill = Calories)) +
  geom_area() +
  labs(title = "Calories effect on Weight and Mass",
       x = "Weight in Pounds", 
       y = "Body Mass Index",
       fill = "Calories") +
  theme_calc()


#bubble
library(ggplot2)
ggplot(Weight_vs_Calories, aes(x = BodyMassIndex, y = weight_pounds, size = Calories, color = BodyMassIndex)) +
  geom_point(alpha = 0.6) +
  scale_size(range = c(1, 10)) +
  scale_color_viridis_c() +
  labs(title = "BMI, Calories and Weight",
       x = "Body Mass Index", 
       y = "Weight in Pounds",
       size = "Calories",
       color = "BMI") +
  theme_minimal()


ggplot(Weight_vs_Calories, aes(x = BodyMassIndex, y = WeightPounds, size = Calories, color = Calories)) + 
  geom_point(alpha = 0.6) + 
  scale_size(range = c(1,10)) + 
  scale_color_viridis_c(name = "Calories") + 
  labs(title = "BMI, Calories and Weight", x = "Body Mass Index", y = "Weight in Pounds", size = "Calories") + 
  theme_minimal()

ggplot(Weight_vs_Calories, aes(x = BodyMassIndex, y = WeightPounds, size = Calories, color = Calories)) + 
  geom_point(alpha = 0.6) + 
  scale_size(range = c(1,10)) + 
  scale_color_viridis_c(name = "Calories") + 
  labs(title = "BMI, Calories and Weight", x = "Body Mass Index", y = "Weight in Pounds", size = "Calories") + 
  theme_minimal()