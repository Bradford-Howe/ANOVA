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
        main = "", # Prevent a middle justified title; we'll add it with title()
        )  

# Add left-justified multi-line title with italics on the second line
title(main = expression(bold("Figure 1")),
                        adj = 0,    # 0 = left justified
                        line = 3.5  # Adjust vertical positioning if needed
      )

title(main = expression(italic("Frequency Distribution of Carburetors in the mtcars Dataset")),
      adj = 0,          # 0 = left justified
      line = 1.5,     # Adjust vertical positioning if needed
                        )

title(sub = expression(italic("Note:"),
      adj = 0)
      )
      

title(sub = expression("This is where the note goes.",
      adj = .05)
      )


# Alternative using paste() + bquote() if you prefer non-expression approach:
title(main = bquote("Frequency Distribution of Carburetors" ~ .(italic("Note: This is where the note goes."))),
      adj = 0)


##############################################

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
            mgp = c(2.2, 0.6, 0))

# Add left-justified figure title (bold "Figure 1")
title(main = expression(bold("Figure 1")),
      adj = 0,      # 0 = left justified
      line = 3.5)

# Add left-justified italic caption/title
title(main = expression(italic("Frequency Distribution of Carburetors in the mtcars Dataset")),
      adj = 0,
      line = 1.8)

# === LEFT-JUSTIFIED NOTE (best method for APA) ===
mtext(expression(paste(italic("Note."), " This is where the note goes. Additional text can continue here as needed.")),
      side = 1,          # bottom
      line = 3.8,        # distance below x-axis (adjust as needed)
      adj = 0,           # 0 = left justified
      cex = 1)         # slightly smaller text for notes

