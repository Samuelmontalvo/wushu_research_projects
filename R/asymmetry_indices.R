#' Calculate four interlimb asymmetry indices
#'
#' Given left and right limb vectors, returns a data frame with four
#' asymmetry indices per observation:
#'
#' - **Index1** (absolute asymmetry): |L - R| / max(L, R) * 100
#' - **Index2** (limb symmetry index): (L - R) / (L + R) * 100
#' - **Index3** (bilateral strength asymmetry): (45 - atan(L/R) * 180/pi) / 90 * 100
#' - **Index4** (natural-log ratio): ln(L / R) * 100
#'
#' @param left  Numeric vector of left-limb values.
#' @param right Numeric vector of right-limb values.
#' @param suffix Character suffix appended to column names (e.g. "AvgF").
#' @return A tibble with columns Index1_{suffix} .. Index4_{suffix}.
calc_asymmetry_indices <- function(left, right, suffix = "") {
  L <- pmax(0, left,  na.rm = FALSE)
  R <- pmax(0, right, na.rm = FALSE)

  idx1 <- dplyr::if_else(
    pmax(L, R) == 0 | is.na(L) | is.na(R),
    NA_real_,
    abs(L - R) / pmax(L, R) * 100
  )

  idx2 <- dplyr::if_else(
    (L + R) == 0 | is.na(L) | is.na(R),
    NA_real_,
    (L - R) / (L + R) * 100
  )

  idx3 <- dplyr::if_else(
    R == 0 | is.na(L) | is.na(R),
    NA_real_,
    (45 - atan(L / R) * (180 / pi)) / 90 * 100
  )

  idx4 <- dplyr::if_else(
    L <= 0 | R <= 0 | is.na(L) | is.na(R),
    NA_real_,
    log(L / R) * 100
  )

  tag <- if (nzchar(suffix)) paste0("_", suffix) else ""

  tibble::tibble(
    !!paste0("Index1", tag) := idx1,
    !!paste0("Index2", tag) := idx2,
    !!paste0("Index3", tag) := idx3,
    !!paste0("Index4", tag) := idx4
  )
}
