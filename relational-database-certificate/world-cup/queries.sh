#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "SELECT SUM((SELECT SUM(winner_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id) + (SELECT SUM(opponent_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id))")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "SELECT AVG(winner_goals) FROM games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND(AVG(winner_goals), 2) FROM games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "SELECT ((SELECT avg(winner_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id) + (SELECT avg(opponent_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id))")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "SELECT MAX(winner_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(winner_goals) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "SELECT name FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE year = 2018 and round = 'Final'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE teams.team_id IN (SELECT winner_id AS id FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE year = 2014 AND round = 'Eighth-Final' ) OR teams.team_id IN ( SELECT opponent_id FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE year = 2014 AND round = 'Eighth-Final') ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE teams.team_id IN (SELECT winner_id AS id FROM teams LEFT JOIN games ON games.winner_id = teams.team_id) ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE  round = 'Final' ORDER BY name DESC")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE teams.team_id IN (SELECT winner_id FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE name LIKE 'Co%' ) OR teams.team_id IN ( SELECT opponent_id FROM teams LEFT JOIN games ON games.winner_id = teams.team_id WHERE name LIKE 'Co%' ) AND name LIKE 'Co%' ORDER BY name")"
