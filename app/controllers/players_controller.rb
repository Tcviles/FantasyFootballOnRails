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
    @position_rank = (Player.all.where(position:@player.position).order(:adp).find_index(@player).to_i+1).ordinalize
    @player_rank = (Player.all.order(:adp).find_index(@player).to_i+1).ordinalize
  end
end
