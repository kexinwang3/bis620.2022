library(devtools)
library(lubridate)
library(dplyr)
library(ggplot2)

document()
document()

data(ukb_accel)

dt <- first(ukb_accel$time)

ukb_accel |>
  filter(time >= dt  & time < dt + minutes(5)) |>
  accel_plot() +
    theme_minimal() +
    xlab("Time") +
    ylab("Acceleration (in gravities)")

ukb_accel |>
  filter(time >= dt & time < dt + minutes(5)) |>
  spectral_signature(take_log = FALSE) |>
  accel_plot()
