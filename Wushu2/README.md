# Wushu2

This folder contains the longitudinal dataset and helper loaders.

## Project notebooks

- `longitudinal/wushu_longitudinal_analysis.Rmd`
- `longitudinal/wushu_longitudinal_ml_asymmetries.Rmd`

## Data files

- `data/wushu_longitudinal_jumps_1yr.csv`
- `data/wushu_longitudinal_demographics.csv`

## Load functions

Source the loader script:

```r
source("Wushu2/R/load_data.R")
```

Load longitudinal:

```r
long_jumps <- load_wushu_longitudinal("jumps")
long_demo <- load_wushu_longitudinal("demographics")
long_all <- load_wushu_longitudinal("all")
```
