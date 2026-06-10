library(broom)
library(car)
library(ggplot2)
library(gt)
library(gtsummary)
library(ggpubr)
library(emmeans)
library(psych)


Lab8Data = read.table('Lab8_Displays.csv',sep = ',', header = T)

Lab8Data$Resolution = factor(Lab8Data$Resolution)
Lab8Data$LightLevel = factor(Lab8Data$LightLevel)

options(contrasts = c("contr.sum", "contr.poly"))
options(contrasts = c("contr.treatment", "contr.poly"))


a = lm(LivesLost ~ Resolution*LightLevel,Lab8Data)
summary(a)
Anova(a, type = 3)


describe(Lab8Data)

data(mtcars)
data(bfi)
rm(mtcars)
mtcars$mpg =  mtcars$mpg + 1
datasets::mtcars$mpg
mtcars$mpg
obk
obk.long
OBrienKaiser
