# ===================================================================
# Title: workout01: 3) Data Preparation
# Description:
#   The primary goal of this stage is to create a csv data file
# shots-data.csv that will contain the required variables to be
# used in the visualization phase.
# Input(s): data files 'andre-iguodala.csv', 'draymond-green.csv',
# 'kevin-durant.csv', 'klay-thompson.csv', 'stephen-curry.csv'
# Output(s): data file 'shots-data.csv', 5 'first-last-summary.txt's
# Author: Ruiwen (Adele) Shen
# Date: 3-13-2019
# ===================================================================

library(readr)    # for importing data tables
library(dplyr)    # for manipulating data frames
library(ggplot2)  # for graphics

iguodala  = read.csv("../data/andre-iguodala.csv", stringsAsFactors = FALSE)
green = read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE)
durant = read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson = read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE)
curry = read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE)

iguodala$name<- "Andre Iguodala"
green$name<- "Draymond Green"
durant$name<- "Kevin Durant"
thompson$name<- "Klay Thompson"
curry$name<- "Stephen Curry"

iguodala$shot_made_flag[iguodala$shot_made_flag=="n"] <- "shot_no"
iguodala$shot_made_flag[iguodala$shot_made_flag=="y"] <- "shot_yes"
green$shot_made_flag[green$shot_made_flag=="n"] <- "shot_no"
green$shot_made_flag[green$shot_made_flag=="y"] <- "shot_yes"
durant$shot_made_flag[durant$shot_made_flag=="n"] <- "shot_no"
durant$shot_made_flag[durant$shot_made_flag=="y"] <- "shot_yes"
thompson$shot_made_flag[thompson$shot_made_flag=="n"] <- "shot_no"
thompson$shot_made_flag[thompson$shot_made_flag=="y"] <- "shot_yes"
curry$shot_made_flag[curry$shot_made_flag=="n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag=="y"] <- "shot_yes"

iguodala$minute <- (iguodala$period*12 - iguodala$minutes_remaining)
green$minute <- (green$period*12 - green$minutes_remaining)
durant$minute <- (durant$period*12 - durant$minutes_remaining)
thompson$minute <- (thompson$period*12 - thompson$minutes_remaining)
curry$minute <- (curry$period*12 - curry$minutes_remaining)

sink(file = '../output/andre-iguodala-summary.txt')
summary(iguodala)
sink()

sink(file = '../output/draymond-green-summary.txt')
summary(green)
sink()

sink(file = '../output/kevin-durant-summary.txt')
summary(durant)
sink()

sink(file = '../output/klay-thompson-summary.txt')
summary(thompson)
sink()

sink(file = '../output/stephen-curry-summary.txt')
summary(curry)
sink()

shots <- rbind(iguodala, green, durant, thompson, curry)
write_csv(shots, path = '../data/shots-data.csv')

sink(file = '../output/shots-data-summary.txt')
summary(shots)
sink()

