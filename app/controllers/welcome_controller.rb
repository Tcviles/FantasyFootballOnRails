class WelcomeController < ApplicationController
  before_action :delete_bad_leagues
  def home
    @leagues = League.all
    @current_leagues = current_user.leagues
    @available_leagues = (@leagues - @current_leagues).select{|league| !league.full}
    @best_team = Team.best_team
  end

  private
    def delete_bad_leagues
      League.all.each do |league|
        league.destroy if (league.teams.size == 0)
      end
    end
end
