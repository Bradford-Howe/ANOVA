library(broom)
library(car)
library(ggplot2)
library(gt)
library(gtsummary)
library(ggpubr)
library(emmeans)
library(psych)

for (i in 1:4)
{
      a=t.test(iris[iris$Species == levels(iris$Species)[1],i],
             iris[iris$Species == levels(iris$Species)[2],i])
      b=t.test(iris[iris$Species == levels(iris$Species)[1],i],
             iris[iris$Species == levels(iris$Species)[3],i])
      c=t.test(iris[iris$Species == levels(iris$Species)[2],i],
             iris[iris$Species == levels(iris$Species)[3],i])
      print(a)
      print(b)
      print(c)
}

t.test(iris[iris$Species == levels(iris$Species)[2],2],
       iris[iris$Species == levels(iris$Species)[3],2])
