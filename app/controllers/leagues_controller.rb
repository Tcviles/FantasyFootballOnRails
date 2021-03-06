class LeaguesController < ApplicationController
  before_action :set_positions
  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
    @team = Team.new
  end

  def create
    @league = League.create(:name => league_params[:name])
    @team = Team.new(:name => team_params[:name], :player_ids => player_id_values)
    @team.league = @league
    @team.mascot_attributes=(team_params[:mascot_attributes])
    @team.user = current_user
    if @team.save
      redirect_to @league
    else
      flash[:error] = @league.errors.full_messages + @team.errors.full_messages
      redirect_to new_league_path
    end
  end

  def destroy
    @league = League.find(params[:id])
    if @league.owner == current_user
      @league.destroy
      redirect_to root_path
    else
      redirect_to @league
    end
  end

  private
    def league_params
      params.require(:league)
    end

    def team_params
      league_params.require(:team).permit(:name, player_ids:[@positions.values], mascot_attributes:[:id, :name,:color,:motto])
    end
end
