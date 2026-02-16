.resolve_data_dir <- function(data_dir = NULL) {
  candidates <- unique(c(
    data_dir,
    file.path("Wushu2", "data"),
    "data",
    file.path("..", "data")
  ))

  candidates <- candidates[!is.na(candidates) & nzchar(candidates)]
  existing <- candidates[file.exists(candidates) & dir.exists(candidates)]

  if (length(existing) == 0) {
    stop("Could not resolve data directory. Checked: ", paste(candidates, collapse = ", "))
  }

  existing[[1]]
}

load_sukma <- function(
  dataset = c("raw", "details", "processed", "all"),
  data_dir = NULL
) {
  dataset <- match.arg(dataset)
  data_dir <- .resolve_data_dir(data_dir)

  files <- list(
    raw = file.path(data_dir, "sukma_cmj_averages_tests_raw.csv"),
    details = file.path(data_dir, "sukma_athlete_details.xlsx"),
    processed = file.path(data_dir, "sukma_wushu_processed.csv")
  )

  missing_files <- files[!file.exists(unlist(files))]
  if (length(missing_files) > 0) {
    stop("Missing SUKMA file(s): ", paste(names(missing_files), collapse = ", "))
  }

  if (dataset == "raw") {
    return(readr::read_csv(files$raw, show_col_types = FALSE))
  }

  if (dataset == "details") {
    return(readxl::read_excel(files$details))
  }

  if (dataset == "processed") {
    return(readr::read_csv(files$processed, show_col_types = FALSE))
  }

  list(
    raw = readr::read_csv(files$raw, show_col_types = FALSE),
    details = readxl::read_excel(files$details),
    processed = readr::read_csv(files$processed, show_col_types = FALSE)
  )
}

# Alias kept for naming consistency with "SUMAC" project wording.
load_sumac <- function(
  dataset = c("raw", "details", "processed", "all"),
  data_dir = NULL
) {
  load_sukma(dataset = dataset, data_dir = data_dir)
}

load_wushu_longitudinal <- function(
  dataset = c("jumps", "demographics", "all"),
  data_dir = NULL
) {
  dataset <- match.arg(dataset)
  data_dir <- .resolve_data_dir(data_dir)

  files <- list(
    jumps = file.path(data_dir, "wushu_longitudinal_jumps_1yr.csv"),
    demographics = file.path(data_dir, "wushu_longitudinal_demographics.csv")
  )

  missing_files <- files[!file.exists(unlist(files))]
  if (length(missing_files) > 0) {
    stop("Missing longitudinal file(s): ", paste(names(missing_files), collapse = ", "))
  }

  if (dataset == "jumps") {
    return(readr::read_csv(files$jumps, show_col_types = FALSE))
  }

  if (dataset == "demographics") {
    return(readr::read_csv(files$demographics, show_col_types = FALSE))
  }

  list(
    jumps = readr::read_csv(files$jumps, show_col_types = FALSE),
    demographics = readr::read_csv(files$demographics, show_col_types = FALSE)
  )
}
