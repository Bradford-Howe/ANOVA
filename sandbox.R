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

# Simulate a realistic 2 × 2 × 3 design (easy for students to follow)
set.seed(42)
n <- 120
ThreeWay <- data.frame(
   Resolution  = factor(rep(c("QVGA", "VGA"), each = n/2)),
   LightLevel  = factor(rep(c("Low", "High"), times = n/2)),
   DisplayType = factor(rep(c("LCD", "OLED", "MiniLED"), length.out = n)),
   LivesLost   = rnorm(n, mean = 12, sd = 4)
)

# Add a clear three-way interaction pattern
ThreeWay$LivesLost <- with(ThreeWay, LivesLost + 
                              ifelse(Resolution == "VGA" & LightLevel == "High" & DisplayType == "OLED", 8, 0) -
                              ifelse(Resolution == "QVGA" & LightLevel == "Low"  & DisplayType == "MiniLED", 6, 0))

# Fit the model (using the same Type III / contr.sum approach you already teach)
options(contrasts = c("contr.sum", "contr.poly"))
ThreeLM <- lm(LivesLost ~ Resolution * LightLevel * DisplayType, data = ThreeWay)

# Three-way interaction plot
cat_plot(ThreeLM,
         pred  = Resolution,      # x-axis
         modx  = LightLevel,      # different lines
         mod2  = DisplayType,     # different panels
         geom  = "line",
         interval = TRUE)

