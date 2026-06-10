library(car)
library(psych)
library(emmeans)


Lab7Data = read.table('Lab7_Caffeine.csv', sep = ',', header = T)
Lab7Data$caffeine = factor(Lab7Data$caffeine)

options(contrasts = c("contr.sum", "contr.poly"))
#options(contrasts = c("contr.treatment", "contr.poly"))

model = lm(accuracy_scores ~ caffeine, Lab7Data )

summary(model)

leveneTest(accuracy_scores ~ caffeine, data = Lab7Data)

Anova(model, type = 3)

# Bonferroni correct multple t-tests
emmeans(model, pairwise ~ caffeine, adjust = "bonferroni")

# Equivanlent to LSD
emmeans(model, pairwise ~ caffeine, adjust = "none")

emmeans(model, pairwise ~ caffeine, adjust = "tukey")



Table = table(Lab7Data)
ff=rowSums(Table)

barplot(ff)

barplot(ff, # table() will give you frequencies.
        space = 0, # No spaces will make this a histogram.
        col = 0, # No fill for APA style.
        ylab = "Frequency",
        xlab = "Accuracy Scores",
        main = "", # Prevent a middle justified title; we'll add it with title()
        yaxs = 'i',
        xaxs = 'i'
)  

# Add left-justified multi-line title with italics on the second line
title(main = expression(bold("Figure 1")),
      adj = 0,    # 0 = left justified
      line = 3.5  # Adjust vertical positioning if needed
)

title(main = expression(italic("Frequency Distribution of Accuracy Scores")),
      adj = 0,          # 0 = left justified
      line = 1.5,     # Adjust vertical positioning if needed
)

# The opening word 'Note:' and the note itself need to be coded seperately in 
# order to get them to be on the same line.
title(sub = expression(italic("Note:")),
      adj = 0,
      line = 3
)

title(sub = "This is where the note goes.",
     adj = .055,
     line = 3
)
