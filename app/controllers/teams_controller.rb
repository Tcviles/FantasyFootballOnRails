class TeamsController < ApplicationController
  before_action :define_league, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_positions
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(:name => team_params[:name], :player_ids => player_id_values)
    @team.league = @league
    @team.mascot_attributes=(team_params[:mascot_attributes])
    @team.user = current_user
    if @team.save
      redirect_to @league
    else
      flash[:error] = @team.errors.full_messages
      redirect_to new_league_team_path(@league)
    end
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team=Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.name = team_params[:name]
    @team.player_ids = player_id_values
    @team.mascot_attributes = (team_params[:mascot_attributes])
    @team.user = current_user
    if @team.save
      redirect_to @league
    else
      flash[:error] = @team.errors.full_messages
      redirect_to edit_league_team_path(@league, @team)
    end
  end


  def destroy
    @team = Team.find(params[:id])
    if @team.user == current_user
      @team.destroy
      redirect_to @league
    else
      redirect_to @league
    end
  end

  private
    def team_params
      params.require(:team).permit(:name, :league_id, player_ids:[@positions.values], mascot_attributes:[:id, :name,:color,:motto])
    end

    def define_league
      @league = League.find(params[:league_id] || params[:team][:league_id])
    end
end
  
