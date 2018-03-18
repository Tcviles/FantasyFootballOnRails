class LeaguesController < ApplicationController
  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
    @team = @league.teams.build
    @rb = Player.all.where(:position_id => 1).order(:name)
    @wr = Player.all.where(:position_id => 2).order(:name)
    @te = Player.all.where(:position_id => 3).order(:name)
    @qb = Player.all.where(:position_id => 4).order(:name)
    @flex = (@rb+@wr+@te).sort_by{|player| player.name}
  end

  def create
    @league = League.find_or_create_by(:name => league_params[:name])
    @team = Team.new(:name => team_params[:name], :player_ids => player_id_values)
    @team.league = @league
    @team.mascot_attributes=(team_params[:mascot_attributes])
    @team.user = current_user
    binding.pry
    @team.save
    redirect_to @league
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy
    redirect_to root_path
  end

  private
    def league_params
      params.require(:league)
    end

    def team_params
      league_params.require(:new_team).permit(:name, player_ids:[:qb,:rb,:wr,:flex,:te], mascot_attributes:[:name,:color,:motto])
    end

    def player_id_values
      team_params[:player_ids].values
    end
end
