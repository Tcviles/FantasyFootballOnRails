User
  -has many leagues, through teams
  -has many teams
  -email, password

League
  -has many users, through teams
  -has many teams
  -has many players, through League_players
  -league name

Team
  -belongs to league
  -belongs to user
  -has many players, through Team_players
  -team name

Team_players
  -belongs to team
  -belongs to player

League_players
  -belongs to league
  -belongs to player

Player
  -has many leagues, through League_players
  -has many teams, through Team_players
  -belongs to Position
  -name
  -nfl-team
  -average draft position (adp)
  -average fantasy points (fp/g)

Position
  -has many players
  -name



  Players ratings
  1 create a migration add ratings attr
  2 create method to assign ratings based on score
  3 make the ratings viewable.
