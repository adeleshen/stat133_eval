context("Check summary arguments")

test_that("bin_choose returns correct calculation", {

  expect_equal(bin_choose(5, 3), choose(5, 3))
  expect_equal(bin_choose(5, 5), choose(5, 5))
  expect_equal(bin_choose(5, 0), choose(5, 0))
})

test_that("bin_choose fails if k > n", {

  expect_equal(bin_choose(2, 1), 2)
  expect_equal(bin_choose(2, 2), 1)
  expect_error(bin_choose(1, 2))
})

test_that("bin_choose is length 1", {

  expect_length(bin_choose(1, 1), 1)
  expect_length(bin_choose(2, 1), 1)
  expect_length(bin_choose(1, 0), 1)
})


test_that("bin_probability fails if prob is a not number between 0 and 1", {

  expect_error(bin_probability(0, 1, -4))
  expect_error(bin_probability(0, 1, 4))
  expect_error(bin_probability(0, 1, -0.6))
})

test_that("bin_probability is error if prob is invalid", {

  expect_error(bin_probability(0, 1, 2))
  expect_error(bin_probability(0, 1, "0.5"))
  expect_error(bin_probability(0, 1, "hi"))
})

test_that("bin_probability fails if trials are not non-negative integer value", {

  expect_error(bin_probability(0, -1.5, 0.5))
  expect_error(bin_probability(0, 1.5, 0.5))
  expect_error(bin_probability(0, -3, 0.5))
})

test_that("bin_probability fails if success are not non-negative integer value", {

  expect_error(bin_probability(-1.5, 5, 0.5))
  expect_error(bin_probability(1.5, 5, 0.5))
  expect_error(bin_probability(-1:1, 5, 0.5))
})

test_that("bin_probability fails if success > trials values", {

  expect_error(bin_probability(success = 5, trials = 0, 0.5))
  expect_error(bin_probability(4, 3, 0.5))
  expect_error(bin_probability(2, 1, 0.5))
})

test_that("bin_distribution fails if prob is a not number between 0 and 1", {

  expect_error(bin_distribution(5, 2))
  expect_error(bin_distribution(5, -2))
  expect_error(bin_distribution(5, 1.01))
})

test_that("bin_distribution is error if prob is invalid", {

  expect_error(bin_distribution(1, 2))
  expect_error(bin_distribution(1, "0.5"))
  expect_error(bin_distribution(1, "hi"))
})

test_that("bin_distribution fails if trials are not non-negative integer value", {

  expect_error(bin_distribution(-1.5, 0.5))
  expect_error(bin_distribution(1.5, 0.5))
  expect_error(bin_distribution(-3, 0.5))
})


test_that("bin_cumulative fails if prob is a not number between 0 and 1", {

  expect_error(bin_cumulative(1, -0.01))
  expect_error(bin_cumulative(1, 1.01))
  expect_error(bin_cumulative(1, 7))
})

test_that("bin_cumulative is error if prob is invalid", {

  expect_error(bin_cumulative(1, 2))
  expect_error(bin_cumulative(1, "0.5"))
  expect_error(bin_cumulative(1, "hi"))
})

test_that("bin_cumulative fails if trials are not non-negative integer value", {

  expect_error(bin_cumulative(-1.5, 0.5))
  expect_error(bin_cumulative(1.5, 0.5))
  expect_error(bin_cumulative(-3, 0.5))
})


