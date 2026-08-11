library(broom)
library(car)
library(ggplot2)
library(gt)
library(gtsummary)
library(ggpubr)
library(emmeans)
library(psych)


Q3df = data.frame( Group1 = c(6,4,5,3,6,2,4,5,7,5),
                   Group2 = c(12,8,9,7,8,11,7,11,19,11)
                  )
	

write.table(Q3df, "A2_Q3_data.csv",sep = ",",
            row.names = F, quote = F)


cookies = data.frame(
   Vanilla = c(1, 3, 1, 3, 1),
   Chocolate = c(5, 6, 2, 4, 5),
   PeanutButter = c(7, 3, 5, 5, 6)
)

write.table(cookies, "A2_Q2_data.csv",sep = ",",
            row.names = F, quote = F)
