test_that(
  "The spectral_signature() returns an S3 object with class data.frame.",
  {
    data(ukb_accel)
    s <-  spectral_signature(ukb_accel[1:100, ])
    expect_s3_class(s, "data.frame")
  }
)

test_that(
  "The spectral_signature() runs without error when take_log is true.",
  {
    data(ukb_accel)
    expect_no_error(spectral_signature(ukb_accel[1:100, ], take_log = TRUE))
  }
)
