# Figure for the report: delayed effect of experimental leaf damage on fruits.
# Descriptive only (no model or test): raw points plus the group median.

#' Plot fruits per plant in 2014 by experimental damage level in 2013.
#'
#' Fruits in 2014 are the year after the damage treatment, which is the delayed
#' effect named in the paper's title. Every plant is shown (jittered sideways so
#' points do not overlap) and the median marks the centre of each group. The
#' jitter uses a fixed seed: without one, ggplot2 draws new offsets every time
#' the figure is rendered, so the image would differ between runs.
#' Explain points and bars in the caption.
#'
#' @param data Output of [clean_folivory()].
#' @return A ggplot object.
plot_fruits <- function(data) {
  ggplot2::ggplot(
    data,
    ggplot2::aes(
      x = .data$experimental_damage_2013,
      y = .data$number_of_fruits_2014
    )
  ) +
    ggplot2::geom_point(
      position = ggplot2::position_jitter(
        width = 0.15,
        height = 0,
        seed = 4821
      ),
      alpha = 0.6
    ) +
    ggplot2::stat_summary(
      fun = median,
      geom = "crossbar",
      width = 0.5,
      linewidth = 0.4
    ) +
    ggplot2::labs(
      x = "Experimental leaf damage in 2013 (% of leaf area)",
      y = "Fruits per plant in 2014"
    )
}
