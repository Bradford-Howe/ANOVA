


##############################################
DataForPlot = mtcars

#Set a serifed font
par(family = "serif")

# Create the barplot (histogram-like)
bp = barplot(table(mtcars$carb),
            space = 0,          # Makes it look more like a histogram
            col = "white",     # Light gray fill (or "white" for no fill)
            ylab = "Frequency",
            xlab = "Number of Carburetors",
            cex.lab = 1.3,
            main = "",          # Leave empty - we'll add it manually
            cex.names = 1,    # Optional: slightly larger x-axis labels
            cex.axis = 1,
            yaxs = 'i',
            xaxs = 'i',
            mgp = c(2.2, 0.6, 0)
            )

# Add left-justified figure title (bold "Figure 1")
title(main = expression(bold("Figure 1")),
      adj = 0,      # 0 = left justified
      line = 3.5)

# Add left-justified italic caption/title
title(main = expression(italic("Frequency Distribution of Carburetors in the mtcars Dataset")),
      adj = 0,
      line = 1.8)

# === LEFT-JUSTIFIED NOTE (best method for APA) ===
mtext(expression(paste(italic("Note."), " This is where the note goes.")),
      side = 1,          # bottom
      line = 3.8,        # distance below x-axis (adjust as needed)
      adj = 0,           # 0 = left justified
      cex = 1)         # slightly smaller text for notes

#Restore default font
par(family = "")


##############################################
##############################################

# Create frequency table for carburetors 0–9, even though several of those numbers
# have zero fequency; i.e., there are no cars with 0 or 5 carburetors. This
# leaves all options open for making a frequency table.
carb = factor(mtcars$carb, levels = 0:9)

# This set of functions gives us the frequency for each level we just made and
# makes the table have the right format for our work.
freq = as.numeric(table(carb))

# This gives us the total number of engines measured.
freq_total = sum(freq)

# Relative frequency is the frequency of a certain value relative to the total.
rel_freq = freq / freq_total

# This function adds in sequence the frequencies we have measured; i.e., the 
# number of engines with 0 carbs. plus those with 1, plus those with 2...
cumu_f = cumsum(freq)

# The converts the cumulative fequency to a percentage of the total.
cumu_pct = cumu_f / n * 100


# Build the table. In the data.frame function you write the name of the column,
# then the equal sign, then what you want to go in that column.
tab = data.frame(
   Carburetors = 0:9, # Make a line in the table for each value
   f = freq,
   `Relative f` = round(rel_f,2), # Rounds to two decimal places
   `Cumulative f` = cum_f,
   `Cumulative %` = round (cumu_pct),
   check.names = F
)

# Add Total row
tab = rbind(tab, data.frame(
   Carburetors = "Total",
   f = n,
   `Relative f` = "",
   `Cumulative f` = "",
   `Cumulative %` = "",
   check.names = FALSE
))

# Print with APA-style title
cat("Table 1\n\n")
cat("Frequencies of the Number of Carburetors in Various Car Models\n\n")
print(tab, row.names = FALSE)
