## Data `andre-iguodala.csv`, `draymond-green.csv`, `kevin-durant.csv`, `klay-thompson.csv`, `stephen-curry.csv`

#  Here's the description of the data variables:
- `team_name`: indicating name of NBA team (character)
- `game_date`: date of NBA game, MM/DD/YYYY
- `season`: numeric, indicating year of a full of set of NBA games, for example "2016" (integer?)
- `period`: an NBA game is divided in 4 periods of 12 mins each. For example, a value
for period = 1 refers to the first period (the first 12 mins of the game) ()
- `minutes_remaining`: numeric, indicating number of minutes remaining to be played in the given period  ()
- `seconds_remaining`: numeric, indicating number of seconds remaining to be played in the given period (0)
- `shot_made_flag` indicates whether a shot was made (y) or missed (n), later changed to "made shot" and "missed shot" respectively (character)
- `action_type`: the basketball move used by players to score, either to pass by defenders to gain access to the basket, or to get a clean pass to a teammate to score a two pointer or three pointer (character)
- `shot_type`: indicates whether a shot is a 2-point field goal, or a 3-point field goal (character)
- `shot_distance`: distance to the basket, measured in feet (integer)
- `opponent`: indicating team that the subject's team was playing against (character)
- `x`: court x-coordinate (measured in inches) where shot occurred ()  
- `y`: court y-coordinate (measured in inches) where shot occurred ()