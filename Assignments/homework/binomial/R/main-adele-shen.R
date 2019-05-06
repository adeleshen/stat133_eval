#' @title Combination Function
#' @description Calculates the number of combinations in which k successes can occur in n trials
#' @param n number of trials (numeric)
#' @param k number of successful trials (numeric)
#' @return number of combinations in which k successes can occur in n trials (numeric)
#' @export
#' @examples
#' # Calculate 5 choose 2
#' bin_choose(n = 5, k = 2)
#'
#' # Choose different numbers of successes
#' bin_choose(5, 1:3)

bin_choose = function(n, k) {
  if (sum(as.integer(k <= n)) != length(k <= n)) {
    stop("k cannot be greater than n")
  }
  return((factorial(n) / (factorial(k)*factorial(n-k))))
}

#' @title Binomial Probability Function
#' @description Calculates the probability of the number of successes in a fixed number of random trials
#' performed under identical conditions (assuming a constant probability of success on each trial)
#' @param trials number of trials (numeric)
#' @param success number of successful trials (numeric)
#' @param prob probability of success (numeric)
#' @return probability of the number of successes occurring in the number of trials (numeric)
#' @export
#' @examples
#' Probability of getting 2 successes in 5 trials
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#'
#' Probabilities of getting 2 or less successes in 5 trials
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)

bin_probability = function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  bin_choose(trials, success)*(prob^success)*(1-prob)^(trials-success)
}

#' @title Binomial Probability Distribution Function
#' @description Calculates probabilities about the number of successes in a fixed number of random trials
#' performed under identical conditions (assuming a constant probability of success on each trial)
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return data.frame of classes "bindis" and "data.frame" with the probability of the number of successes
#' occurring in the number of trials
#' @export
#' @examples
#' # binomial probability distribution
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution = function(trials, prob) {
  dat = data.frame(success = 0:trials, probability = bin_probability(success = 0:trials, trials, prob))
  return(structure(dat, class = c("bindis", "data.frame")))
}

#' @export
plot.bindis = function(dat, ...) {
  return(barplot(height = dat$probability, names.arg = dat$success, xlab = 'successes', ylab = 'probability'))
}

#' @title Binomial Cumulative Distribution Function
#' @description Calculates probabilities about the number of successes in a fixed number of random trials
#' performed under identical conditions (assuming a constant probability of success on each trial)
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return data.frame of classes "bincum" and "data.frame" with the probability of the number of successes
#' occurring in the number of trials and the cumulative probability (of at that number of successes or less)
#' @export
#' @examples
#  # binomial cumulative distribution
#' bin_cumulative(trials = 5, prob = 0.5)

bin_cumulative = function(trials, prob) {
  dat = data.frame(success = 0:trials, probability = bin_probability(success = 0:trials, trials, prob))
  dat$cumulative = rep(0, trials+1)
  for (i in 0:trials+1) {
    dat$cumulative[i] = sum(dat$probability[1:i])
  }
  return(structure(dat, class = c("bincum", "data.frame")))
}

#' @export
plot.bincum = function(dat, ...) {
  return(plot(x = dat$success, y = dat$cumulative, type = 'b', xlab = 'successes', ylab = 'cumulative probability'))
}

#' @title Binomial Random Variable Info
#' @description Returns a list that displays the number of trials and probability of success
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return object of class "binvar", a binomial random variable object with elements "trials" and "prob"
#' @export
#' @examples
#' # 10 trials and probability of success 0.3
#' bin_variable(10, 0.3)

bin_variable = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bvar = list(trials = trials, prob = prob)
  bvar = structure(bvar, class = "binvar")
  return(bvar)
}


#' @title Binomial Mean
#' @description Calculates the mean or expected value of a binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return mean (numeric)
#' @export
#' @examples bin_mean(10, 0.3)
bin_mean = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title Binomial Variance
#' @description Calculates the variance of a binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return variance (numeric)
#' @export
#' @examples bin_variance(10, 0.3)
bin_variance = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title Binomial Mode
#' @description Calculates the mode of a binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return mode (numeric)
#' @export
#' @examples bin_mode(10, 0.3)
bin_mode = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title Binomial Skewness
#' @description Calculates the skewness of a binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return skewness (numeric)
#' @export
#' @examples bin_skewness(10, 0.3)
bin_skewness = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title Binomial Kurtosis
#' @description Calculates the kurtosis of a binomial distribution
#' @param trials number of trials (numeric)
#' @param prob probability of success (numeric)
#' @return kurtosis (numeric)
#' @export
#' @examples bin_kurtosis(10, 0.3)
#'
bin_kurtosis = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}


