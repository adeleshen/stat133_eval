
context("Check checker arguments")

test_that("check_prob is a number between 0 and 1", {

  expect_true(check_prob(0))
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
})

test_that("check_prob fails with invalid lengths", {

  expect_error(check_prob(1:3))
  expect_error(check_prob(c(1,2)))
  expect_error(check_prob(1,2))
})

test_that("check_prob is error if prob is invalid", {

  expect_error(check_prob(-1))
  expect_error(check_prob(2))
  expect_error(check_prob("hi"))
})


test_that("check_trials fails without integer inputs", {

  expect_true(check_trials(2))
  expect_error(check_trials(0.5))
  expect_error(check_trials(2.1))
})

test_that("check_trials fails without non-negative inputs", {

  expect_error(check_trials(-11))
  expect_error(check_trials(0.00001))
  expect_error(check_trials(-2))
})

test_that("check_trials is of length 1", {

  expect_error(check_trials(1,2))
  expect_error(check_trials(c(1,2)))
  expect_error(check_trials(1:3))
})


test_that("check_success fails if trials are not non-negative integer value", {

  expect_error(check_success(1, -1.5))
  expect_error(check_success(1, 1.5))
  expect_error(check_success(1, -3))
})

test_that("check_success fails if success are not non-negative integer value", {

  expect_error(check_success(-1.5, 5))
  expect_error(check_success(1.5, 5))
  expect_error(check_success(-1:1, 5))
})

test_that("check_success fails if success > trials values", {

  expect_true(check_success(1, 2))
  expect_true(check_success(1, 1))
  expect_error(check_success(2, 1))
})

test_that("check_success is of length 1", {

  expect_length(check_success(0:2, 2), 1)
  expect_length(check_success(c(1, 3), 5), 1)
  expect_length(check_success(4, 5), 1)
})
