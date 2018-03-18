class WelcomeController < ApplicationController
  def home
    @leagues = League.all
    @current_leagues = current_user.leagues
    @available_leagues = (@leagues - @current_leagues).select{|league| !league.full}
  end
end
