# ===================================================================
# Title: workout01: 4) Shot Charts
# Description:
#   The primary goal of this stage is to create use the csv data file
# shots-data.csv that contain the required variables to visualize the
# shots made by each player on the court.
# Input(s): data file 'shots-data.csv', image 'court-image.jpg'
# Output(s): pdf 'gsw-shot-charts.pdf', 5 'lastname_shot_chart.pdf's
# Author: Ruiwen (Adele) Shen
# Date: 3-13-2019
# ===================================================================

library(readr)    # for importing data tables
library(dplyr)    # for manipulating data frames
library(ggplot2)  # for graphics
install.packages(c("jpeg", "grid"))
install.packages("gridExtra")
library(gridExtra)
library(jpeg)
library(grid)

shots = read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)

iguodala_scatterplot <- ggplot(filter(shots, name == "Andre Iguodala")) +
  geom_point(aes(x= x, y= y, color = shot_made_flag))
print(iguodala_scatterplot)

green_scatterplot <- ggplot(filter(shots, name == "Draymond Green")) +
  geom_point(aes(x= x, y= y, color = shot_made_flag))
print(green_scatterplot)

durant_scatterplot <- ggplot(filter(shots, name == "Kevin Durant")) +
  geom_point(aes(x= x, y= y, color = shot_made_flag))
print(durant_scatterplot)

thompson_scatterplot <- ggplot(filter(shots, name == "Klay Thompson")) +
  geom_point(aes(x= x, y= y, color = shot_made_flag))
print(thompson_scatterplot)

curry_scatterplot <- ggplot(filter(shots, name == "Stephen Curry")) +
  geom_point(aes(x= x, y= y, color = shot_made_flag))
print(curry_scatterplot)

court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# 4.1 Shot charts of each player

iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
ggsave('../images/andre-iguodala-shot-chart.pdf', 
       plot = iguodala_shot_chart,
       width = 6.5, height = 5, units = "in")

green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()
ggsave('../images/draymond-green-shot-chart.pdf', 
       plot = green_shot_chart,
       width = 6.5, height = 5, units = "in")

durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
ggsave('../images/kevin-durant-shot-chart.pdf', 
       plot = durant_shot_chart,
       width = 6.5, height = 5, units = "in")

thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
ggsave('../images/klay-thompson-shot-chart.pdf', 
       plot = thompson_shot_chart,
       width = 6.5, height = 5, units = "in")

curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
ggsave('../images/stephen-curry-shot-chart.pdf', 
       plot = curry_shot_chart,
       width = 6.5, height = 5, units = "in")


# 4.2 Facetted Shot Chart

all <- rbind(iguodala, green, durant, thompson, curry)
gsw_shot_chart <- ggplot(data = all) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x= x, y= y, color = shot_made_flag), cex = 1) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  facet_wrap(~ name) +
  theme_minimal() +
  theme(legend.position = "top",
        legend.title = element_blank())

ggsave('../images/gsw-shot-charts.pdf', 
       plot = gsw_shot_chart,
       width = 8, height = 7, units = "in")

ggsave('../images/gsw-shot-charts.png', 
       plot = gsw_shot_chart,
       width = 8, height = 7, units = "in")

