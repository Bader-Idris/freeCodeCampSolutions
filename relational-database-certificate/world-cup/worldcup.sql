-- log into the project on the virtual server with:
-- psql --username=freecodecamp --dbname=postgres
CREATE DATABASE worldcup;
-- \c worldcup; --connecting
CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  UNIQUE(name)
);
CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_goals NUMERIC(1,0) NOT NULL,
  opponent_goals NUMERIC(1,0) NOT NULL,
  -- these are foreign keys
  winner_id INT REFERENCES teams(team_id),
  opponent_id INT REFERENCES teams(team_id)
);