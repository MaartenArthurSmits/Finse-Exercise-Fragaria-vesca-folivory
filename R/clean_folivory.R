# Main cleaning demo for the folivory data.
# Guide refs: D (clean separately, explicit recodes, stop on surprises), F.

#' Clean the raw folivory table.
#'
#' Decisions (minimal cleaning, all documented here):
#' - Names to snake_case (spaces make column access awkward).
#' - `experimental_damage_2013` becomes an ordered factor of the four designed
#'   leaf-damage levels (0, 10, 25, 50 % leaf area), as given in the codebook.
#' - `natural_damage_2014` is an ordinal score (1-4 classes), kept as an
#'   ordered factor.
#' - `dead_2014` is kept even though all plants survived (codebook), so the
#'   table still matches the original; it is simply constant.
#' - No rows are dropped: NA values stay NA and are handled per analysis.
#'
#' @param raw Data frame read from `data/csv/folivory_data.csv` with
#'   `na.strings = c("", ".")`: the authors code missing values as ".", which
#'   otherwise turns six numeric columns into text.
#' @return A data frame, one row per plant.
clean_folivory <- function(raw) {
  out <- janitor::clean_names(raw)

  damage_levels <- c(0, 10, 25, 50)
  stopifnot(
    "numeric columns read as text: use na.strings = c('', '.')" =
      is.numeric(out$spad_2013) && is.numeric(out$runner_biomass_2014),
    "observation IDs must be unique" = !anyDuplicated(out$observation),
    "unexpected experimental damage level" =
      all(out$experimental_damage_2013 %in% damage_levels),
    "unexpected natural damage class" = all(out$natural_damage_2014 %in% 1:4)
  )

  out$experimental_damage_2013 <- factor(
    out$experimental_damage_2013,
    levels = damage_levels,
    labels = paste0(damage_levels, "%"),
    ordered = TRUE
  )
  out$natural_damage_2014 <- factor(
    out$natural_damage_2014,
    levels = 1:4,
    ordered = TRUE
  )
  out$block <- factor(out$block)
  out
}
