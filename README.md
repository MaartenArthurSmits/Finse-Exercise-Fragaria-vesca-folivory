# Finse exercise: reproducible workflow with *Fragaria vesca* data

Exercise for the UiB PhD course "Open, Reproducible and Transparent Science"
(Finse, October 2026), built with `targets`, `renv` and Quarto.

## Data

Muola, A., & Stenberg, J. A. (2018). *Data from: Folivory has long-term effects on
sexual but not on asexual reproduction in woodland strawberry* [Dataset]. Dryad.
https://doi.org/10.5061/dryad.69r593t. Licence CC0 1.0. Paper: Muola & Stenberg (2018),
Ecology and Evolution, https://doi.org/10.1002/ece3.4687.

- `data/raw/`: the original Excel file, never edited (md5 `ddf5756b78fc20ea4f7db678166295f1`, matches the record).
- `data/csv/`: a CSV copy of each sheet (`data` and the codebook `code`), exported once with no cleaning and checked equal to the sheets (see `report.qmd`).
- `data/clean/`: the cleaned data, written by the pipeline.

## Files

- `R/clean_folivory.R`: the cleaning function.
- `_targets.R`: the pipeline (read, clean, write, render the report).
- `report.qmd`: reproducible document explaining and checking each step.

## How to run (to be completed)

1. `renv::restore()`
2. `targets::tar_make()` from the project root. It writes `data/clean/folivory_clean.csv` and renders `report.html`.

## Licence

The code (`R/`, `_targets.R`, `report.qmd`) is released under the MIT licence (see `LICENSE`).
The data are not covered by it: they keep their original CC0 1.0 licence from the Dryad record.

## Limitations

To be completed.
