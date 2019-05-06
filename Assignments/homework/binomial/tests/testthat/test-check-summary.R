context("Check summary arguments")

test_that("aux_mean fails if prob is not a numeric (or logical) value", {

  expect_error(aux_mean(1, "1"))
  expect_error(aux_mean(1, "hi"))
  expect_error(aux_mean(1, hi))

})

test_that("aux_mean fails if trials is not numeric (or logical) value", {

  expect_error(aux_mean("1", 0.5))
  expect_error(aux_mean("hi", 0.5))
  expect_error(aux_mean(hi, 0.5))
})

test_that("aux_mean returns the right value", {

  expect_equal(aux_mean(5, 0.1), 0.5)
  expect_equal(aux_mean(5, 0.5), 2.5)
  expect_equal(aux_mean(5, 1), 5)
})


test_that("aux_variance fails if prob is not a numeric (or logical) value", {

  expect_error(aux_variance(1, "1"))
  expect_error(aux_variance(1, "hi"))
  expect_error(aux_variance(1, hi))

})

test_that("aux_variance fails if trials is not numeric (or logical) value", {

  expect_error(aux_variance("1", 0.5))
  expect_error(aux_variance("hi", 0.5))
  expect_error(aux_variance(hi, 0.5))
})

test_that("aux_variance returns the right value") {
  expect_equal(aux_variance(4, 0.5), 1)
  expect_equal(aux_variance(4, 0), 0)
  expect_equal(aux_variance(4, 1), 0)
})


test_that("aux_mode fails if prob is not a numeric (or logical) value", {

  expect_error(aux_mode(1, "1"))
  expect_error(aux_mode(1, "hi"))
  expect_error(aux_mode(1, hi))

})

test_that("aux_mode fails if trials is not numeric (or logical) value", {

  expect_error(aux_mode("1", 0.5))
  expect_error(aux_mode("hi", 0.5))
  expect_error(aux_mode(hi, 0.5))
})

test_that("aux_mode returns the right value(s)", {

  expect_equal(aux_mode(7, 0.5), c(4, 5))
  expect_equal(aux_mode(6, 0.5), 3)
  expect_equal(aux_mode(7, 0.2), 1)

})

test_that("aux_skewness fails if prob is not a numeric (or logical) value", {

  expect_error(aux_skewness(1, "1"))
  expect_error(aux_skewness(1, "hi"))
  expect_error(aux_skewness(1, hi))

})

test_that("aux_skewness fails if trials is not numeric (or logical) value", {

  expect_error(aux_skewness("1", 0.5))
  expect_error(aux_skewness("hi", 0.5))
  expect_error(aux_skewness(hi, 0.5))
})

test_that("aux_skewness returns the right value", {

  expect_equal(aux_skewness(7, 0.5), 0)
  expect_equal(aux_skewness(6, 0.5), 0)
  expect_equal(aux_skewness(7, 0.2), 0.5669467)

})

test_that("aux_kurtosis fails if prob is not a numeric (or logical) value", {

  expect_error(aux_kurtosis(1, "1"))
  expect_error(aux_kurtosis(1, "hi"))
  expect_error(aux_kurtosis(1, hi))

})

test_that("aux_kurtosis fails if trials is not numeric (or logical) value", {

  expect_error(aux_kurtosis("1", 0.5))
  expect_error(aux_kurtosis("hi", 0.5))
  expect_error(aux_kurtosis(hi, 0.5))
})

test_that("aux_kurtosis returns the right value", {

  expect_equal(aux_kurtosis(7, 0.5), -0.2857143)
  expect_equal(aux_kurtosis(6, 0.5), -0.3333333)
  expect_equal(aux_kurtosis(7, 0.2), 0.03571429)

})






