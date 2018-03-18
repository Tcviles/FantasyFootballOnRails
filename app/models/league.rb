class League < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :league_players
  has_many :players, through: :league_players

  def full
    self.users.size >10
  end

  def current_winner
    @teams=self.teams.sort_by{|team| team.score}
    @teams.first
  end
end
