library(broom)
library(car)
library(ggplot2)
library(gt)
library(gtsummary)
library(ggpubr)
library(emmeans)
library(afex)

Lab7Data = read.table('Lab7_Displays.csv',sep = ',', header = T)

aov_car(LivesLost~Resolution * LightLevel + Error(),Lab7Data)
data(mtcars)
data(bfi)
rm(mtcars)
mtcars$mpg =  mtcars$mpg + 1
datasets::mtcars$mpg
mtcars$mpg
obk
obk.long
OBrienKaiser
