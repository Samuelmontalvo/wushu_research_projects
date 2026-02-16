# wushu_research_projects

Wushu2 research workspace for longitudinal (1-year) jump monitoring of Wushu athletes.

The repository is organized so notebooks load data through shared functions in `Wushu2/R/load_data.R`, with datasets standardized in `Wushu2/data`.

## Structure

- `Wushu2/longitudinal`: longitudinal-related R Markdown notebooks
- `Wushu2/data`: longitudinal datasets
- `Wushu2/R/load_data.R`: centralized data loader (`load_wushu_longitudinal`)

## Quick Start (R)

```r
source("Wushu2/R/load_data.R")

longitudinal <- load_wushu_longitudinal("all")
```
