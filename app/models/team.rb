class Team < ApplicationRecord
  belongs_to :league
  belongs_to :user
  belongs_to :mascot
  has_many :team_players
  has_many :players, through: :team_players
  validates_presence_of :name, :league_id, :user_id, :mascot_id
  validate :must_have_5_player_ids

  def must_have_5_player_ids
    if self.player_ids.uniq.size != 5
      errors.add(:player_ids, "must_have_5_unique_player_ids")
    end
  end

  def score
    @score = 0
    self.players.each do |player|
      @score = @score + player.adp
    end
    @score
  end

  def mascot_attributes=(mascot_attributes)
    mascot_attributes.delete_if{|k, v| v.empty?}
    if !!mascot_attributes[:id]
      mascot = Mascot.find(mascot_attributes[:id])
    elsif mascot_attributes.empty?
      mascot = nil
    else
      mascot = Mascot.find_or_create_by(mascot_attributes)
    end
    self.mascot = mascot
  end

  def self.best_team
    Team.all.sort_by{|team| team.score}.first
  end
end
