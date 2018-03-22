class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  private

  def player_id_values
    team_params[:player_ids].values
  end

  def set_positions
    @positions = {:quarterback => :qb, :running_back=>:rb, wide_reciever: :wr, tight_end: :te, defense: :dst}
  end
end
