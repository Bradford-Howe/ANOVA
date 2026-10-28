# test_assignment5_flags.R
# Run from the directory that contains Assignment5_working.qmd
# and the two data files (A5Data_wide.csv, A5Data_long.csv).
#
# Systematically renders the QMD under a focused set of flag combinations
# that exercise the distinct code paths, then reports success/failure.

library(rmarkdown)   # or quarto if you prefer; this uses rmarkdown::render

# ---------------------------------------------------------------------------
# Test matrix
# Each row is one render.  Logical flags are written as T/F.
# AdjustmentChoice is written as a quoted string.
# ---------------------------------------------------------------------------
tests <- data.frame(
  id = c(
    # Four designs, omnibus only (follow-ups off)
    "WW_omnibus",
    "BW_omnibus",
    "WB_omnibus",
    "BB_omnibus",
    # Fully within + main-effect follow-ups
    "WW_main_none",
    "WW_main_bonf",
    "WW_main_tukey",
    # Fully within + efficient interaction (Genre | Month, no simple needed)
    "WW_GenreAtMonth",
    # Fully within + Month | Genre with simple effect (repeated)
    "WW_MonthAtGenre_simple",
    # Fully within + Month | Genre without simple (still should render)
    "WW_MonthAtGenre_nosimple",
    # Fully within + both interaction directions + simples
    "WW_both_dirs",
    # Mixed designs with a follow-up
    "BW_followup",
    "WB_followup",
    "BB_followup"
  ),
  GenreRepeated        = c(T, F, T, F,   T, T, T,   T,   T,   T,   T,   F, T, F),
  MonthRepeated        = c(T, T, F, F,   T, T, T,   T,   T,   T,   T,   T, F, F),
  DoGenreFollowup      = c(F, F, F, F,   T, T, T,   F,   F,   F,   T,   F, F, T),
  DoMonthFollowup      = c(F, F, F, F,   T, T, T,   F,   F,   F,   T,   T, F, T),
  DoGenreAtMonth       = c(F, F, F, F,   F, F, F,   T,   F,   F,   T,   F, F, F),
  DoMonthAtGenre       = c(F, F, F, F,   F, F, F,   F,   T,   T,   T,   F, F, F),
  GenreSimple          = c(F, F, F, F,   F, F, F,   F,   F,   F,   F,   F, F, F),
  GenreSimpleRepeated  = c(F, F, F, F,   F, F, F,   F,   F,   F,   F,   F, F, F),
  MonthSimple          = c(F, F, F, F,   F, F, F,   F,   T,   F,   T,   F, F, F),
  MonthSimpleRepeated  = c(F, F, F, F,   F, F, F,   F,   T,   F,   T,   F, F, F),
  AdjustmentChoice     = c("none","none","none","none",
                           "none","bonferroni","tukey",
                           "none","none","none","none",
                           "none","none","none"),
  stringsAsFactors = FALSE
)

# ---------------------------------------------------------------------------
# Helper: replace a single assignment line of the form  name = value
# ---------------------------------------------------------------------------
replace_flag <- function(txt, name, value) {
  # value may be T/F or a quoted string
  val_str <- if (is.logical(value)) {
    if (value) "T" else "F"
  } else {
    paste0('"', value, '"')
  }
  pattern <- paste0("(?m)^", name, "\\s*=\\s*[^\\n]*")
  replacement <- paste0(name, " = ", val_str)
  sub(pattern, replacement, txt, perl = TRUE)
}

# ---------------------------------------------------------------------------
# Run the tests
# ---------------------------------------------------------------------------
results <- data.frame(
  id = tests$id,
  success = logical(nrow(tests)),
  message = character(nrow(tests)),
  stringsAsFactors = FALSE
)

qmd_path <- "Assignment5_working.qmd"
if (!file.exists(qmd_path)) stop("Cannot find ", qmd_path, " in the working directory.")

original <- readLines(qmd_path, warn = FALSE)

for (i in seq_len(nrow(tests))) {
  cat("\n====", tests$id[i], "====\n")
  txt <- original

  # Apply every flag
  flag_names <- c("GenreRepeated","MonthRepeated",
                  "DoGenreFollowup","DoMonthFollowup",
                  "DoGenreAtMonth","DoMonthAtGenre",
                  "GenreSimple","GenreSimpleRepeated",
                  "MonthSimple","MonthSimpleRepeated",
                  "AdjustmentChoice")
  for (nm in flag_names) {
    txt <- replace_flag(txt, nm, tests[[nm]][i])
  }

  # Write temporary QMD
  tmp <- paste0("_tmp_", tests$id[i], ".qmd")
  writeLines(txt, tmp)

  # Render
  ok <- TRUE
  msg <- ""
  tryCatch({
    # Suppress the HTML file; we only care whether it completes
    rmarkdown::render(tmp,
                      output_file = paste0("_tmp_", tests$id[i], ".html"),
                      quiet = TRUE,
                      envir = new.env())
  }, error = function(e) {
    ok <<- FALSE
    msg <<- conditionMessage(e)
  })

  results$success[i] <- ok
  results$message[i] <- if (ok) "OK" else msg
  cat(if (ok) "OK\n" else paste("FAIL:", msg, "\n"))

  # Clean temporary QMD (leave HTML if you want to inspect failures)
  unlink(tmp)
}

# ---------------------------------------------------------------------------
# Summary
# ---------------------------------------------------------------------------
cat("\n\n========== SUMMARY ==========\n")
print(results[, c("id", "success")], row.names = FALSE)
cat("\nFailures:\n")
fails <- results[!results$success, ]
if (nrow(fails) == 0) {
  cat("None.\n")
} else {
  print(fails[, c("id", "message")], row.names = FALSE)
}

# Optional: write the full results to a CSV
write.csv(results, "assignment5_flag_test_results.csv", row.names = FALSE)
cat("\nFull results written to assignment5_flag_test_results.csv\n")
