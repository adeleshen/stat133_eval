#' @export
print.binvar = function(bvar) {
  print("Binomial variable")
  print("Parameters", quote = FALSE)
  print(paste0("- number of trials: ", bvar$trials), quote = FALSE)
  print(paste0("- prob of success : ", bvar$prob), quote = FALSE)
}

#' @export
summary.binvar = function(bvar) {
  sum_bvar = list(trials = bvar$trials, prob = bvar$prob, mean = aux_mean(bvar$trials, bvar$prob), variance = aux_variance(bvar$trials, bvar$prob), mode = aux_mode(bvar$trials, bvar$prob), skewness = aux_skewness(bvar$trials, bvar$prob), kurtosis = aux_kurtosis(bvar$trials, bvar$prob))
  sum_bvar = structure(sum_bvar, class = "summmary.binvar")
  return(sum_bvar) }

print.summary.binvar = function(sum_bvar) {
  print("Summary Binomial")
  print("Parameters", quote = FALSE)
  print(paste0("- number of trials: ", sum_bvar$trials), quote = FALSE)
  print(paste0("- prob of success : ", sum_bvar$prob), quote = FALSE)
  print("Measures", quote = FALSE)
  print(paste0("- mean: ", sum_bvar$mean), quote = FALSE)
  print(paste0("- variance: ", sum_bvar$variance), quote = FALSE)
  print(paste0("- mode: ", sum_bvar$mode), quote = FALSE)
  print(paste0("- skewness: ", sum_bvar$skewness), quote = FALSE)
  print(paste0("- kurtosis: ", sum_bvar$kurtosis), quote = FALSE)
}
