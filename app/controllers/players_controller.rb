class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.save
    redirect_to players_path
  end

  def index
    @players = Player.all.order(:adp)
  end

  def show
    @players = Player.all
  end

  private
    def player_params
      params.require(:player).permit(:name, :nfl_team, :adp, :avg_fantasy_ppg, :position_id)
    end
end
