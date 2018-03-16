class Player < ApplicationRecord
  has_many :leagues, through: :league_players
  has_many :teams, through: :team_players
  belongs_to :position

  validates_presence_of :name, :nfl_team, :adp, :position_id

  def self.get_page
    doc = Nokogiri::HTML(open("https://www.fantasypros.com/nfl/rankings/ppr-cheatsheets.php"))
  end

  def self.get_players
    self.get_page.css(".player-row")
  end

  def self.update_players
    self.get_players.each do |player|
      baller_name = player.css(".full-name").text
      baller = Player.find_or_create_by(:name => baller_name)
      position = player.css(".wsis")[0]["data-position"]
      baller.position = Position.find_or_create_by(:name => position)
      baller.nfl_team = player.css(".wsis")[0]["data-team"]
      baller.adp = player.css(".ranks")[2].text.to_i
      baller.save
    end
  end
end
