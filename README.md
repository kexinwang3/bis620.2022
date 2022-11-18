
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bis620.2022

<!-- badges: start -->

[![R-CMD-check](https://github.com/kexinwang3/bis620.2022/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/kexinwang3/bis620.2022/actions/workflows/R-CMD-check.yaml)
[![Build](https://app.travis-ci.com/kexinwang3/bis620.2022.svg?branch=main)](https://app.travis-ci.com/kexinwang3/bis620.2022)
[![Codecov test
coverage](https://codecov.io/gh/kexinwang3/bis620.2022/branch/main/graph/badge.svg)](https://app.codecov.io/gh/kexinwang3/bis620.2022?branch=main)
[![test-coverage](https://github.com/kexinwang3/bis620.2022/actions/workflows/test-coverage.yaml/badge.svg)](https://github.com/kexinwang3/bis620.2022/actions/workflows/test-coverage.yaml)
[![lint](https://github.com/kexinwang3/bis620.2022/actions/workflows/lint.yaml/badge.svg)](https://github.com/kexinwang3/bis620.2022/actions/workflows/lint.yaml)
<!-- badges: end -->

## Description

bis620.2022 provides tools to get the spectral signature of
accelerometry data and plot UKBiobank data.

-   [R CMD
    Check](https://github.com/kexinwang3/bis620.2022/actions/workflows/R-CMD-check.yaml)
-   [Codecov](https://app.codecov.io/gh/kexinwang3/bis620.2022?branch=main)
-   [Coverage
    tests](https://github.com/kexinwang3/bis620.2022/actions/workflows/test-coverage.yaml)
-   [Lint
    results](https://github.com/kexinwang3/bis620.2022/actions/workflows/lint.yaml)

## Installation

You can install the development version of bis620.2022 from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("kexinwang3/bis620.2022")
```

## Example

This is a basic example which shows you how to solve a common problem:

-   Attach required packages

``` r
library(bis620.2022)
library(lubridate)
library(dplyr)
library(ggplot2)
#> Warning: package 'ggplot2' was built under R version 4.2.2
```

-   Load the dataset `ukb_accel`

``` r
data(ukb_accel)
# Extract the first value from ukb_accel$time
dt <- first(ukb_accel$time)
```

-   Plot UKBiobank accelerometry data

``` r
# Plot UKBiobank accelerometry data
ukb_accel |>
  filter(time >= dt  & time < dt + minutes(5)) |>
  accel_plot() +
    theme_minimal() +
    xlab("Time") +
    ylab("Acceleration (in gravities)")
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

-   Plot spectral signature of UKBiobank accelerometry data

``` r
ukb_accel |>
  filter(time >= dt & time < dt + minutes(5)) |>
  spectral_signature(take_log = TRUE) |>
  filter(freq <= 10) |>
  accel_plot() +
    theme_minimal()
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />
