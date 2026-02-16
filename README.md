# wushu_research_projects

Wushu2 research workspace for two active analysis tracks:

- SUMAC normative data analysis
- Wushu longitudinal (1-year) jump monitoring

The repository is organized so notebooks load data through shared functions in `Wushu2/R/load_data.R`, with datasets standardized in `Wushu2/data`.

## Structure

- `Wushu2/SUMAC`: SUMAC-related R Markdown notebooks
- `Wushu2/longitudinal`: longitudinal-related R Markdown notebooks
- `Wushu2/data`: standardized SUMAC and longitudinal datasets
- `Wushu2/R/load_data.R`: centralized data loaders (`load_sumac`, `load_wushu_longitudinal`)

## Quick Start (R)

```r
source("Wushu2/R/load_data.R")

sumac <- load_sumac("all")
longitudinal <- load_wushu_longitudinal("all")
```
