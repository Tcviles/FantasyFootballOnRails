class Player < ApplicationRecord
  has_many :leagues, through: :league_players
  has_many :teams, through: :team_players
  belongs_to :position

  def ppg
    self.avg_fantasy_ppg
  end
end
