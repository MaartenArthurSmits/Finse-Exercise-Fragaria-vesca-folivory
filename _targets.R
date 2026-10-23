# Pipeline. Run from the project root: targets::tar_make()
# Course ref: Thursday "reproducible workflows" (targets); guide section T.
library(targets)

# Loads clean_folivory() and plot_fruits() from R/
tar_source("R")

list(
  # format = "file": targets reruns downstream steps if the CSV changes
  tar_target(folivory_csv, "data/csv/folivory_data.csv", format = "file"),
  # na.strings: the authors code missing values as "." (see clean_folivory())
  tar_target(folivory_raw, read.csv(folivory_csv, na.strings = c("", "."))),
  tar_target(folivory_clean, clean_folivory(folivory_raw)),
  # The cleaned CSV keeps factor labels but not their order; use the
  # folivory_clean target (not this file) in analyses.
  tar_target(
    folivory_clean_csv,
    {
      out <- "data/clean/folivory_clean.csv"
      dir.create(dirname(out), showWarnings = FALSE)
      write.csv(folivory_clean, out, row.names = FALSE, na = "", fileEncoding = "UTF-8")
      out
    },
    format = "file"
  ),
  tar_target(fruit_figure, plot_fruits(folivory_clean)),
  # Renders report.qmd after the targets it reads with tar_read()
  tarchetypes::tar_quarto(report, "report.qmd")
)
