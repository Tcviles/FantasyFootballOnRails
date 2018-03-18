class TeamsController < ApplicationController
  def new
    @players = Player.all
    @team = Team.new
    @rb = @players.where(:position_id => 1)
    @wr = @players.where(:position_id => 2)
    @te = @players.where(:position_id => 3)
    @qb = @players.where(:position_id => 4)
    @flex = (@rb+@wr+@te).sort
  end

  def create
    @team = Team.new(team_params)
    @team.player_ids = params[:team][:player_ids].values
    @league = League.find(team_params[:league_id].to_i)
    @team.user = current_user
    @team.save
    redirect_to @league
  end

  def show
    @team = Team.find(params[:id])
  end

  def destroy
    @team = Team.find(params[:id])
    @league = League.find(@team.league_id)
    @team.destroy
    redirect_to @league
  end

  private
    def team_params
      params.require(:team).permit(:name, :league_id)
    end
end
