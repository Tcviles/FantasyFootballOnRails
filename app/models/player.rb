class Player < ApplicationRecord
  has_many :leagues, through: :league_players
  has_many :teams, through: :team_players
  belongs_to :position

  validates_presence_of :name, :nfl_team, :adp, :avg_fantasy_ppg, :position_id
end
