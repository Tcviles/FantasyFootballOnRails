class AddRatingsToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :ratings, :string
  end
end
