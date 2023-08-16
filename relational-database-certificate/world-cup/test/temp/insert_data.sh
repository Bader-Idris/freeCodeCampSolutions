#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  # PSQL="psql -h localhost --port 5433 --username=postgres --dbname=worldcup -t --no-align -c"
  PSQL="psql --port 5433 --username=postgres --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Truncate tables
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND NAME OPPONENT WINNER_GOAL OPPONENT_GOAL; do
  if [[ $NAME != winner ]]; then
    # get team_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$NAME'")
    # if not found
    if [[ -z $TEAM_ID ]]; then
      # insert name
      INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$NAME')")
      # get new team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$NAME'")
      if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]; then
        echo "team: $NAME"
      fi
    fi
    if [[ $OPPONENT != opponent ]]; then
      # get team_id
      TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      # if not found
      if [[ -z $TEAM_ID ]]; then
        # insert opponent
        INSERT_NAME_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
        # get new team_id
        TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        if [[ $INSERT_NAME_RESULT == "INSERT 0 1" ]]; then
          echo "team: $OPPONENT"
        fi
      fi
    fi
  fi
  if [[ $NAME != winner && $OPPONENT != opponent ]]; then
    # Get winner_id and opponent_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$NAME'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    # Insert game into the database
    INSERT_REQUIRED_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES($YEAR, '$ROUND', $WINNER_GOAL, $OPPONENT_GOAL, $WINNER_ID, $OPPONENT_ID)")
    if [[ $INSERT_REQUIRED_RESULT == "INSERT 0 1" ]]; then
      echo "name: $NAME, opponent: $OPPONENT"
    fi
  fi
done