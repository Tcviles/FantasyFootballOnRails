class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    binding.pry
  end
end
