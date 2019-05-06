
Overview
--------

`"binomial"` is an R package that provides functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

-   `bin_choose()` calculates the number of combinations in which k successes can occur in n trials
-   `bin_probability()` calculates the probability of the number of successes in a fixed number of random trials
-   `bin_distribution()` calculates probabilities about the number of successes in a fixed number of random trials into an object "bindis"
-   `plot.bindis()` graphs a barplot to display the probability histogram of a binomial distribution object "bindis"
-   `bin_cumulative()` calculates probabilities about the number of successes in a fixed number of random trials performed under identical conditions (assuming a constant probability of success on each trial) into an object "bincum"
-   `plot.bincum()` graphs the cumulative distribution of object "bincum"
-   `bin_variable()` returns a list that displays the number of trials and probability of success
-   `print.binvar()` prints binomial variable with formatted parameters
-   `summary.binvar()` prints binomial variable with parameters and related calculations like expected value, variance, etc
-   `print.summary.binvar()` prints binomial variables with formatted parameters and measures
-   `bin_mean()` calculates the mean or expected value of a binomial distribution
-   `bin_variance()` calculates the variance of a binomial distribution
-   `bin_mode()` calculates the mode of a binomial distribution
-   `bin_skewness()` calculates the skewness of a binomial distribution
-   `bin_kurtosis()` calculates the kurtosis of a binomial distribution

Motivation
----------

This package has been developed to illustrate the calculations and features of the binomial distribution and to practice creating a complete R package.

Installation
------------

Install the development version from GitHub via the package "devtools":

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "binomial" (without vignettes)
devtools::install_github("adele-shen/binomial")

# install "binomial" (with vignettes)
devtools::install_github("adele-shen/binomial", build_vignettes = TRUE)
```

Usage
-----

``` r
library(binomial)
```

``` r
# n choose k
bin_choose(n = 5, k = 2)
# [1] 10

# probability of getting 2 successes in 5 trials with probability 0.5 of success
bin_probability(success = 2, trials = 5, prob = 0.5)
# [1] 0.3125

# binomial probability distribution
distr = bin_distribution(trials = 5, prob = 0.5)
## success probability
## 1 0 0.03125
## 2 1 0.15625
## 3 2 0.31250
## 4 3 0.31250
## 5 4 0.15625
## 6 5 0.03125

# plotting binomial probability distribution

plot.bindis(distr)
```

![](README-unnamed-chunk-4-1.png)

``` r
# binomial cumulative distribution
cdist = bin_cumulative(trials = 5, prob = 0.5)
## success probability cumulative
## 1 0 0.03125 0.03125
## 2 1 0.15625 0.18750
## 3 2 0.31250 0.50000
## 4 3 0.31250 0.81250
## 5 4 0.15625 0.96875
## 6 5 0.03125 1.00000

# plotting binomial cumulative distribution

plot.bincum(cdist)
```

![](README-unnamed-chunk-5-1.png)

``` r
# Binomial Random Variable Parameters
binvar = bin_variable(trials = 10, prob = 0.3)
# [1] "Binomial variable"
# [1] Parameters
# [1] - number of trials: 10
# [1] - prob of success : 0.3

# Binomial Random Variable Full Summary
sumbin = summary.binvar(binvar)
summary = print.summary.binvar(sumbin)
#summary
# [1] "Summary Binomial"
# [1] Parameters
# [1] - number of trials: 10
# [1] - prob of success : 0.3
# [1] Measures
# [1] - mean: 3
# [1] - variance: 2.1
# [1] - mode: 3
# [1] - skewness: 0.276026223736942
# [1] - kurtosis: -0.123809523809524
```

``` r
bin_mean(10, 0.3)
## [1] 3

bin_variance(10, 0.3)
## [1] 2.1

bin_mode(10, 0.3)
## [1] 3

bin_skewness(10, 0.3)
## [1] 0.2760262

bin_kurtosis(10, 0.3)
## [1] -0.1238095
```
