workout01-adele-shen
================
Ruiwen (Adele) Shen

``` r
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.4.4

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

5.1) Effective Shooting Percentage
==================================

``` r
shots = read.csv("../data/shots-data.csv", stringsAsFactors = FALSE)
```

2PT Effective Shooting % by Player
----------------------------------

``` r
two_pt = shots %>% group_by(name) %>%
  filter(shot_type == '2PT Field Goal') %>%
  select(name, shot_made_flag) %>%
  summarise(
    total = length(shot_made_flag),
    made = sum(shot_made_flag == 'shot_yes')) %>%
  mutate(perc_made = 100 * made / total) %>%
  arrange(desc(perc_made))
```

    ## Warning: package 'bindrcpp' was built under R version 3.4.4

``` r
two_pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134      63.8
    ## 2 Kevin Durant     643   390      60.7
    ## 3 Stephen Curry    563   304      54.0
    ## 4 Klay Thompson    640   329      51.4
    ## 5 Draymond Green   346   171      49.4

3PT Effective Shooting % by Player
----------------------------------

``` r
three_pt = shots %>% group_by(name) %>%
  filter(shot_type == '3PT Field Goal') %>%
  select(name, shot_made_flag) %>%
  summarise(
    total = length(shot_made_flag),
    made = sum(shot_made_flag == 'shot_yes')) %>%
  mutate(perc_made = 100 * made / total) %>%
  arrange(desc(perc_made))
three_pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246      42.4
    ## 2 Stephen Curry    687   280      40.8
    ## 3 Kevin Durant     272   105      38.6
    ## 4 Andre Iguodala   161    58      36.0
    ## 5 Draymond Green   232    74      31.9

Effective Shooting % by Player
------------------------------

``` r
all_pt = shots %>% group_by(name) %>%
  select(name, shot_made_flag) %>%
  summarise(
    total = length(shot_made_flag),
    made = sum(shot_made_flag == 'shot_yes')) %>%
  mutate(perc_made = 100 * made / total) %>%
  arrange(desc(perc_made))
all_pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <chr>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495      54.1
    ## 2 Andre Iguodala   371   192      51.8
    ## 3 Klay Thompson   1220   575      47.1
    ## 4 Stephen Curry   1250   584      46.7
    ## 5 Draymond Green   578   245      42.4

5.2) Narrative
==============

### 

The 2016–17 Golden State Warriors season was magical: the Warriors won their fifth NBA Championship, setting the best postseason record in NBA history by going 16–1 in a five-game victory over Cleveland. The 16-1 run and 0.941 winning postseason percentage are league records, and the Warriors broke over 20 other NBA records as well. There were talks of a Warriors Dynasty.

The Warriors were hailed as a "Superteam" by media and fans alike, and in the center of the enormous spotlight were the "Fantastic Four," comprised of Kevin Durant, Stephen Curry, Klay Thompson and Draymond Green. Stephen Curry set numerous three-point NBA records that season, including most three-pointers made in a single game with 13 and most consecutive games (regular-season and postseason combined) with a made three-pointer with 196. Curry also surpassed 300 three-pointers in the regular-season for the second time in NBA history; he finished with 324. Draymond Green won the Defensive Player of the Year Award at the NBA Awards, the first time a Warrior has won it. Kevin Durant won the NBA Finals MVP award, the third time a Warrior has won it. The Warriors won the Team of the Year Award at the Espy Awards. Kevin Durant, Stephen Curry, Klay Thompson and Draymond Green were all named to the All-Star Game, the first time Golden State have had four All-Stars and just the eighth time in NBA history a single team has had four players in the game. The Warriors were the only team with multiple players named to the All-NBA Team this season, with Curry, Durant and Green all selected.

However, amidst the prolific achievements of Durant, Curry, Thompson, and Green, another impressively effective shooter breaks the ranks of the Fantastic Four.

While Andre Iguodala's shooting quantity pales in comparison to record-breaking superstar teammates's like Stephen Curry and Kevin Durant's, Iguodala's accuracy and effectiveness when he does shoot is an impressive feat not to be discounted.

Throughout his career, Iguodala hasn’t built a reputation as a scorer. In the 2016-17 season, he takes just `all_pt$total[all_pt$name == "Andre Iguodala"] / length(unique(shots$game_date))` = 5.23 shots per game. The most he’s averaged in a season was 15.6 per game in the 2007-08 campaign, back when he was still a member of the Philadelphia 76ers.

The 5.23 shots per game figure is remarkably lower than that of the Fantastic Four. Draymond Green, the lowest of the quartet, has still averaged `all_pt$total[all_pt$name == "Draymond Green"] / length(unique(shots$game_date))` = 8.14 shots per game. Kevin Durant, `all_pt$total[all_pt$name == "Kevin Durant"] / length(unique(shots$game_date))` = 12.89 shots per game, Klay Thompson `all_pt$total[all_pt$name == "Klay Thompson"] / length(unique(shots$game_date))` = 17.18 shots per game (higher still), and Stephen Curry `all_pt$total[all_pt$name == "Stephen Curry"] / length(unique(shots$game_date))` = 17.61 (higher still).

This low stat isn't a liability for the Warriors. In fact, head coach Steve Kerr has commended Iguodala time and time again for his high basketball IQ and even compared him to his former teammate, defensive stalwart Scottie Pippen. Iguodala is an invaluable member of the Golden State Warriors, someone who defends all five positions and creates easy shots for his more celebrated teammates. Almost always in the right position, Iguodala is both an excellent defense specialist and secondary ball handler with assists that make his offensive teammates' jobs infinitely easier.

Iguodala is definitely a well-rounded player, what is shocking, however, is how high his percentage of shots made is amidst the other members this season. Looking at the table of shots taken and made among the five, Andre Iguodala's 51.75% made is second only to Kevin Durant's success rate of 54.10%, although Durant took 2.47 times the number of shots Iguodala did, a testament to his prolific skill (Iguodala took 371 shots to Durant's 915). Thompson, Curry, and Green's stats all lie in the 40-50% range, with Green bringing up the rear with 42.39%.

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
915
</td>
<td style="text-align:right;">
495
</td>
<td style="text-align:right;">
54.09836
</td>
</tr>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
371
</td>
<td style="text-align:right;">
192
</td>
<td style="text-align:right;">
51.75202
</td>
</tr>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
1220
</td>
<td style="text-align:right;">
575
</td>
<td style="text-align:right;">
47.13115
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
1250
</td>
<td style="text-align:right;">
584
</td>
<td style="text-align:right;">
46.72000
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
578
</td>
<td style="text-align:right;">
245
</td>
<td style="text-align:right;">
42.38754
</td>
</tr>
</tbody>
</table>
The Golden State Warriors star players have been known to force plays where there was low feasability of success, and this is readily demonstated as Thompson and Curry's shots made hover at 47% while their number shots taken surpassed 1200, dwarfing the others' figures by 300 shots at least. Iguodala's stats display his level-headedness and prudent judgment; when he does shoot, he scores points over half the time.

<img src="../images/iguodala_shot.jpg" width="80%" style="display: block; margin: auto;" />

To break it down further, let's look only at three-point field goals. Here, Thompson, Curry, and Durant's skills are highlighted, especially Thompson and Curry's, as they both took over twice the number of shots as any of the other three and still came out with the highest percentages made, a formidable 42.41% and 40.76%, respectively.

<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
580
</td>
<td style="text-align:right;">
246
</td>
<td style="text-align:right;">
42.41379
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
687
</td>
<td style="text-align:right;">
280
</td>
<td style="text-align:right;">
40.75691
</td>
</tr>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
272
</td>
<td style="text-align:right;">
105
</td>
<td style="text-align:right;">
38.60294
</td>
</tr>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
161
</td>
<td style="text-align:right;">
58
</td>
<td style="text-align:right;">
36.02484
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
232
</td>
<td style="text-align:right;">
74
</td>
<td style="text-align:right;">
31.89655
</td>
</tr>
</tbody>
</table>
<table>
<thead>
<tr>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
total
</th>
<th style="text-align:right;">
made
</th>
<th style="text-align:right;">
perc\_made
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
Andre Iguodala
</td>
<td style="text-align:right;">
210
</td>
<td style="text-align:right;">
134
</td>
<td style="text-align:right;">
63.80952
</td>
</tr>
<tr>
<td style="text-align:left;">
Kevin Durant
</td>
<td style="text-align:right;">
643
</td>
<td style="text-align:right;">
390
</td>
<td style="text-align:right;">
60.65319
</td>
</tr>
<tr>
<td style="text-align:left;">
Stephen Curry
</td>
<td style="text-align:right;">
563
</td>
<td style="text-align:right;">
304
</td>
<td style="text-align:right;">
53.99645
</td>
</tr>
<tr>
<td style="text-align:left;">
Klay Thompson
</td>
<td style="text-align:right;">
640
</td>
<td style="text-align:right;">
329
</td>
<td style="text-align:right;">
51.40625
</td>
</tr>
<tr>
<td style="text-align:left;">
Draymond Green
</td>
<td style="text-align:right;">
346
</td>
<td style="text-align:right;">
171
</td>
<td style="text-align:right;">
49.42197
</td>
</tr>
</tbody>
</table>
In regards to the two-pointers, one many be surprised to find that Andre Iguodala takes the lead in terms of accuracy at 63.81% made. In fact, excluding Draymond Green, who remains last, the ranking has turned on the its head completely. Truly, the Golden State Warriors are a team in which individual members' strengths mesh well to play impeccably.

Draymond Green has consistently placed last in accuracy of shots, but his claim to fame and what earns him a spot in the "Fantastic Four" is his defensive game. Previously winning the NBA Defensive Player of the Year Award, laying and defending multiple positions, making plays for teammates and spacing the floor are where he shines.

<img src="../images/green_defense.jpg" width="80%" style="display: block; margin: auto;" />

However, one can see from the positions in which he chooses to shoot that he is not the most versatile shooter: looking at his shot chart, his shots are very clustered around certain areas (the three-point line and close to the hoop) and don't have the spread of those of the other members of the "Fantastic Four". This spread may indicate that they are comfortable shooting from anywhere on the court. Andre Iguodala's shot chart, though notably sparse, demonstrates that comfortable spread as well.

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

As the jack-of-all-trades of the Warriors, Iguodala famously provides the oil for the well-oiled machine that is the Golden State Warriors. The support he lends to his teammates is invaluable, and his conservative manner and high basketball IQ are proven to complement his more zealous teammates perfectly. With an impressive two-pointer success rate surpassing those of his "Fantastic" teammates and overall making the shots he takes over half the time, while he is not regarded as a shooter, when he does shoot, Andre Iguodala is not a weak link by any means either.
