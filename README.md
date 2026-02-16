# Wushu Research Projects

Longitudinal analysis of interlimb asymmetries and vertical jump performance in elite Wushu athletes — linear mixed models, spline + AR(1) alternatives, and XGBoost machine-learning predictions.

## Overview

This project investigates how bilateral force asymmetries during countermovement jumps evolve over a one-year training period and whether they predict vertical jump performance. Three research objectives are addressed:

1. **Do interlimb asymmetries change over time, and does the pattern differ by sex?** (Linear mixed models with three-way `week * asymmetry * sex` interactions)
2. **Can non-linear temporal trends and autocorrelation improve model fit?** (Natural-spline + AR(1) mixed models via `nlme`, compared to linear LMMs with AIC/BIC and likelihood-ratio tests)
3. **Can machine learning predict jump height at specific asymmetry thresholds?** (XGBoost with grouped 10-fold CV and hyperparameter tuning)

### Asymmetry Indices

Four indices are computed for each left/right force pair (avg propulsive force, peak propulsive force, estimated impulse):

| Index | Formula | Interpretation |
|-------|---------|----------------|
| Index 1 | \|L − R\| / max(L, R) × 100 | Absolute asymmetry magnitude |
| Index 2 | (L − R) / (L + R) × 100 | Limb symmetry index (directional) |
| Index 3 | (45 − atan(L/R) × 180/π) / 90 × 100 | Bilateral strength asymmetry |
| Index 4 | ln(L / R) × 100 | Natural-log ratio |

## Project Structure

```
├── data/            # Raw longitudinal jump and demographics CSVs
├── R/               # Reusable R functions
│   ├── load_data.R            # Data loader for jump + demographics datasets
│   └── asymmetry_indices.R    # calc_asymmetry_indices() — computes all 4 indices
├── scripts/         # Analysis notebooks (R Markdown → HTML)
│   └── longitudinal_asymmetries_analysis.Rmd   # Main analysis pipeline
├── figures/         # Saved publication-quality plots (300 dpi TIFF)
```

## Quick Start

```r
source("R/load_data.R")
source("R/asymmetry_indices.R")

longitudinal <- load_wushu_longitudinal("all")

# Compute asymmetry indices for any left/right pair
indices <- calc_asymmetry_indices(
  left  = longitudinal$jumps$left_avg_propulsive_force,
  right = longitudinal$jumps$right_avg_propulsive_force,
  suffix = "AvgF"
)
```

## Analysis Pipeline

The main Rmd (`scripts/longitudinal_asymmetries_analysis.Rmd`) renders to HTML and runs:

| Section | What it does |
|---------|--------------|
| **EDA** | Time-series and scatter plots of asymmetry indices vs. jump height, by sex |
| **Linear LMMs** | `lme4::lmer()` models with `week * Index3 * sex` interactions, cross-validated by athlete |
| **Spline + AR(1) LMMs** | `nlme::lme()` with `ns(week)` splines and `corAR1` — captures non-linear trends and temporal autocorrelation |
| **Model Comparison** | AIC/BIC table, likelihood-ratio tests, prediction overlay plots, residual ACF diagnostics |
| **XGBoost** | Grouped 10-fold CV, hyperparameter grid search, feature importance, and predicted jump height at 0–20% asymmetry thresholds |
