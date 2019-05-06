library(testthat)

context("Test for range value") 

test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)
  
  expect_equal(stat_range(x), 4)
  expect_length(stat_range(x), 1)
  expect_type(stat_range(x), 'double')
})

test_that("range works as expected with NAs", {
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(stat_range(y), NA_real_)
  expect_length(stat_range(y), 1) #output is of length one
})

test_that("range works as expected with logical values", {
  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(stat_range(z), 1L)
  expect_length(stat_range(z), 1)
  expect_type(stat_range(z), 'integer')
})

test_that("range fails with non-numeric or coerced-numeric input", {
  w <- letters[1:5]
  
  expect_error(stat_range(w))
})

context("Test for measures of center") 

test_that("center measures work as expected", {
  
  expect_length(stat_centers(x), 2)
  expect_type(stat_centers(z), 'double')
  expect_warning(stat_centers(w))
  
})

context("Test for measures of spread") 
test_that("spread centers works as expected", {
  expect_length(stat_spreads(x), 3)
  expect_error(stat_spreads(y))
  expect_error(stat_spreads(w))
})


