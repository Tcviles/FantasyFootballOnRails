class TeamsController < ApplicationController
  def new
    @players = Player.all
    @team = Team.new
    @rb = @players.where(:position_id => 1).order(:name)
    @wr = @players.where(:position_id => 2).order(:name)
    @te = @players.where(:position_id => 3).order(:name)
    @qb = @players.where(:position_id => 4).order(:name)
    @flex = (@rb+@wr+@te).sort_by{|player| player.name}
  end

  def create
    @league = League.find_or_create_by(:id=>team_params[:league_id].to_i)
    @team = Team.new(:name => team_params[:name], :player_ids => player_id_values)
    @team.league = @league
    @team.mascot_attributes=(team_params[:mascot_attributes])
    @team.user = current_user
    @team.save
    redirect_to @league
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @players = Player.all
    @team = Team.find(params[:id])
    @rb = @players.where(:position_id => 1).order(:name)
    @wr = @players.where(:position_id => 2).order(:name)
    @te = @players.where(:position_id => 3).order(:name)
    @qb = @players.where(:position_id => 4).order(:name)
    @flex = (@rb+@wr+@te).sort_by{|player| player.name}
  end

  def update
    @team = Team.find(params[:id])
    @team.player_ids = params[:team][:player_ids].values
    @league = League.find(team_params[:league_id].to_i)
    @team.user = current_user
    @team.save
    redirect_to @league
  end


  def destroy
    @team = Team.find(params[:id])
    @league = League.find(@team.league_id)
    @team.destroy
    redirect_to @league
  end

  private
    def team_params
      params.require(:team).permit(:name, :league_id, player_ids:[:qb,:rb,:wr,:flex,:te], mascot_attributes:[:name,:color,:motto])
    end

    def player_id_values
      team_params[:player_ids].values
    end
end
