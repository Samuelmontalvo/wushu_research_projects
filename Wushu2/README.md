# Wushu2

This folder contains only the two intended dataset groups and helper loaders.

## Project notebooks

- `SUMAC/sumac_normative_data.Rmd`
- `SUMAC/sumac_script.Rmd`
- `longitudinal/wushu_longitudinal_analysis.Rmd`
- `longitudinal/wushu_longitudinal_ml_asymmetries.Rmd`

## Data files

- `data/sukma_cmj_averages_tests_raw.csv`
- `data/sukma_athlete_details.xlsx`
- `data/sukma_wushu_processed.csv`
- `data/wushu_longitudinal_jumps_1yr.csv`
- `data/wushu_longitudinal_demographics.csv`

## Load functions

Source the loader script:

```r
source("Wushu2/R/load_data.R")
```

`load_sumac()` is an alias for `load_sukma()`.

Load SUKMA:

```r
sumac_raw <- load_sumac("raw")
sumac_details <- load_sumac("details")
sumac_all <- load_sumac("all")
```

Load longitudinal:

```r
long_jumps <- load_wushu_longitudinal("jumps")
long_demo <- load_wushu_longitudinal("demographics")
long_all <- load_wushu_longitudinal("all")
```
