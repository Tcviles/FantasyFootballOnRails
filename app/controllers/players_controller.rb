class PlayersController < ApplicationController
  def index
    @positions = Position.all
    @players = Player.all.order(:adp)
  end

  def sync
    Player.update_players
    redirect_to players_path
  end

  def show
    @player = Player.find(params[:id])
  end
end
