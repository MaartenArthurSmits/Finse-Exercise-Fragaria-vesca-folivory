# Finse exercise: *Fragaria vesca* folivory data

Reproducible workflow (`targets`, `renv`, Quarto) for the UiB course "Open, Reproducible and Transparent Science" (Finse, 2026).

## Run

From the project root, in R:

```r
renv::restore()
targets::tar_make()  # writes data/clean/folivory_clean.csv and report.html
```

## Contents

- `data/raw/` original Excel file (never edited); `data/csv/` CSV copy of each sheet; `data/clean/` cleaned data.
- `R/` the cleaning and plotting functions; `_targets.R` the pipeline; `report.qmd` the report.

## Data and licence

Muola & Stenberg (2018), *Data from: Folivory has long-term effects on sexual but not on asexual reproduction in woodland strawberry*, Dryad, https://doi.org/10.5061/dryad.69r593t (CC0 1.0). Paper: https://doi.org/10.1002/ece3.4687.
The code is MIT-licensed (`LICENSE`); the data keep their CC0 licence.

## Limitations

The figure is descriptive (no model or test). The cleaned CSV stores factor labels but not their order; use the `folivory_clean` target in analyses.
