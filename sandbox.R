DataForPlot = mtcars



barplot(table(mtcars$carb),
        space = 0,
        col = 0,
        main = "Frequency Distribution of Carburetors",
        sub = "Note.This is where the note goes.",
        #ylim = c(0,max(mtcars$carb)),
        ylab = "Frequency",
        xlab = "Number of Carburetors"
       )

# Frequency distribution of carburetors in the mtcars dataset

barplot(table(mtcars$carb), # table() will give you frequencies.
        space = 0, # No spaces will make this a histogram.
        col = 0, # No fill for APA style.
        ylab = "Frequency",
        xlab = "Number of Carburetors",
        main = "",
        )  # Prevent a middle justified title; we'll add it with title()

# Add left-justified multi-line title with italics on the second line
title(main = expression(atop("Figure 1",
                        italic("Frequency Distribution of Carburetors in the mtcars Dataset"))
                        ),
      adj = 0,          # 0 = left justified
      line = 2.5,     # Adjust vertical positioning if needed
      sub = "Note: This is where the note goes.")

# Alternative using paste() + bquote() if you prefer non-expression approach:
# title(main = bquote("Frequency Distribution of Carburetors" ~ .(italic("Note: This is where the note goes."))),
#       adj = 0)
