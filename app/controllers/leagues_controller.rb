class LeaguesController < ApplicationController
  def show
    @league = League.find(params[:id])
  end

  def new
    @league = League.new
    @rb = Player.all.where(:position_id => 1)
    @wr = Player.all.where(:position_id => 2)
    @te = Player.all.where(:position_id => 3)
    @qb = Player.all.where(:position_id => 4)
    @flex = (@rb+@wr+@te).sort
  end

  def create
    @league = League.create(:name => league_params[:name])
    @team = Team.new(:name => team_params[:team_name])
    @team.player_ids = player_id_values
    @team.league = @league
    @team.user = current_user
    @team.save
    redirect_to @league
  end

  private
    def league_params
      params.require(:league)
    end

    def team_params
      params.require(:league).require(:new_team)
    end

    def player_id_values
      params.require(:league).require(:new_team).permit(:qb, :rb, :wr, :flex, :te).values
    end
end
