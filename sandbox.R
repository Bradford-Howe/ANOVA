library(broom)
library(car)
library(ggplot2)
library(gt)
library(gtsummary)
library(ggpubr)
library(emmeans)
library(psych)
library(interactions)
library(ggplot2)


MeansVector = vector()
SDVecotor = vector()
NVector = vector()


vars <- c("Kids", "Vote", "Politics")
a <- NULL
for (v in vars) {
   for (lev in levels(ReportingExampleData[[v]])) {
      desc <- describe(ReportingExampleData[ReportingExampleData[[v]] == lev, "Score"])[c(2:4)]
      a <- rbind(a, desc)
   }
}
rownames(a) <- c(
   paste0("Kids", levels(ReportingExampleData$Kids)),
   paste0("Vote", levels(ReportingExampleData$Vote)),
   paste0("Politics", levels(ReportingExampleData$Politics))
)
kable(a)

   
a = describe(ReportingExampleData[ReportingExampleData$Kids == 1,"Score"])[c(2:4)]

a = rbind(a,
      describe(ReportingExampleData[ReportingExampleData$Kids == 2,"Score"])[c(2:4)])

a = rbind(a,
          describe(ReportingExampleData[ReportingExampleData$Vote == 1,"Score"])[c(2:4)])

a = rbind(a,
          describe(ReportingExampleData[ReportingExampleData$Vote == 2,"Score"])[c(2:4)])

a = rbind(a,
          describe(ReportingExampleData[ReportingExampleData$Politics == 1,"Score"])[c(2:4)])

a = rbind(a,
          describe(ReportingExampleData[ReportingExampleData$Politics == 2,"Score"])[c(2:4)])
a = rbind(a,
          describe(ReportingExampleData[ReportingExampleData$Politics == 3,"Score"])[c(2:4)])


rownames(a) = c(paste0("Kids",levels(ReportingExampleData$Kids)),
             paste0("Vote",levels(ReportingExampleData$Vote)),
             paste0("Politics",levels(ReportingExampleData$Politics)))
