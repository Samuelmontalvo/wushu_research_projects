# Wushu Research Projects

Interlimb asymmetry and longitudinal jump monitoring in competitive Wushu athletes.

## Project Structure

```
├── data/       # Raw and processed datasets
├── R/          # Reusable R functions (data loaders, helpers)
├── scripts/    # Analysis notebooks (R Markdown)
├── figures/    # Saved plots and publication figures
```

## Quick Start

```r
source("R/load_data.R")

longitudinal <- load_wushu_longitudinal("all")
```

## Scripts

| Script | Description |
|--------|-------------|
| `scripts/wushu_longitudinal_analysis.Rmd` | Interlimb asymmetry analysis with mixed-effects models |
| `scripts/wushu_longitudinal_ml_asymmetries.Rmd` | Machine learning (LMM + XGBoost) asymmetry analysis |
