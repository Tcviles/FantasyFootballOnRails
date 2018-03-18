class Team < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :team_players
  has_many :players, through: :team_players
  accepts_nested_attributes_for :players

  def score
    @score = 0
    self.players.each do |player|
      @score = @score + player.adp
    end
    @score
  end
end
