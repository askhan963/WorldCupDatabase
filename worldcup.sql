-- Clean (drop) and create the database
DROP DATABASE IF EXISTS worldcup;
CREATE DATABASE worldcup;

\connect worldcup

-- Create the teams table
CREATE TABLE teams (
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL
);

-- Create the games table
CREATE TABLE games (
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(50) NOT NULL,
  winner_id INT REFERENCES teams(team_id) NOT NULL,
  opponent_id INT REFERENCES teams(team_id) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
);

-- Insert data into the teams table
INSERT INTO teams (team_id, name) VALUES (1, 'Germany'), (2, 'Argentina'), ...;

-- Insert data into the games table
INSERT INTO games (game_id, year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES (1, 2014, 'Final', 1, 2, 1, 0), ...;
