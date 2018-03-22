class League < ApplicationRecord
  has_many :teams
  has_many :users, through: :teams
  has_many :league_players
  has_many :players, through: :league_players
  validates :name, presence: true
  validates :name, uniqueness: true

  def full
    self.users.size >=10
  end

  def current_winner
    @teams=self.teams.sort_by{|team| team.score}
    self.destroy if @teams.first.nil?
    @teams.first
  end

  def owner
    self.teams.order(:id).first.user
  end
end
