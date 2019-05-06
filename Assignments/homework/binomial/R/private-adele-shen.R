# 1.1) Private Checker Functions

# test if an input prob is a valid probability value (i.e. 0 < p < 1)
check_prob = function(prob) {
  if (length(prob) != 1) {
    stop("p must be of length 1")
  }
  if (prob > 1 | prob < 0) {
    stop("p must be a number between 0 and 1")
  }
  return(prob < 1 | prob > 0)
}

# test if an input trials is a valid value for number of trials
# (i.e. trials is a non-negative integer)
check_trials = function(trials) {
  if (length(trials) != 1) {
    stop("trials must be of length 1")
  }
  if (trials != round(trials) | trials <= 0) {
    stop("trials must be non-negative integer value")
  }
  return(trials == round(trials))
}

# test if an input success is a valid value for number of successes (i.e. 0 < k < n)
check_success = function(success, trials) {
  for (i in 1:length(success)) {
    if (length(trials) != 1) {
      stop("trials must be of length 1")
    }
    if (trials != round(trials)) {
      stop("trials must be non-negative integer value")
    }
    else if (success[i] > trials | success[i] != round(success[i]) | success[i] < 0) {
      stop("success cannot be non-integer value or greater than trials and must be non-negative")
    }
  }
  return(TRUE)
}

# 1.2) Private Auxiliary Functions

aux_mean = function(trials, prob) {
  return(trials*prob)
}

aux_variance = function(trials, prob) {
  return(trials*prob*(1-prob))
}

aux_mode = function(trials, prob) {
  if (trials*prob + prob != round(trials*prob + prob)) {
    return(floor(trials*prob + prob))
  }
  else return(c(trials*prob + prob, trials*prob + prob + 1))
}

aux_skewness = function(trials, prob) {
  return((1-2*prob) / sqrt(trials*prob*(1-prob)))
}

aux_kurtosis = function(trials, prob) {
  return((1-6*prob*(1-prob)) / (trials*prob*(1-prob)))
}

