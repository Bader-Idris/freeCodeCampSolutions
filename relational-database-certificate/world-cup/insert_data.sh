#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# year,round,winner,opponent,winner_goals,opponent_goals
# 2018,Final,France,Croatia,4,2

echo $($PSQL "TRUNCATE teams, games")
cat games.csv | while IFS="," read YEAR ROUND NAME OPPONENT WINER_GOAL OPPONENT_GOAL
do
  if [[ $NAME != name ]]
  then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$NAME'")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert name
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$NAME')")
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$NAME'")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $NAME"
      fi
    fi
  
    # ------------------------------------------------------------
    # get game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR")
    # if not found
    if [[ -z $GAME_ID ]]
    then
    # get winner_id
    # SELECT * FROM games LEFT JOIN teams ON games.winner_id = teams.team_id;
    NAME_FILTERED=$($PSQL "SELECT team_id FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE name='$NAME'")
    # get opponent_id
    OPPONENT_FILTERED=$($PSQL "SELECT team_id FROM games LEFT JOIN teams ON games.opponent_id = teams.team_id WHERE name='$OPPONENT'")
    # insert year
        INSERT_REQUIRED_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINER_GOAL, $OPPONENT_GOAL, '$NAME_FILTERED', '$OPPONENT_FILTERED')")
        # get new game_id
        GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR")
      if [[ $INSERT_REQUIRED_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into games, $YEAR"
      fi
    fi

    # insert round
        INSERT_ROUND_RESULT=$($PSQL "INSERT INTO games(round) VALUES('$ROUND')")
        # get new game_id
        GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year=$YEAR")
      if [[ $INSERT_ROUND_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into games, $ROUND"
      fi
    fi
  fi
done

