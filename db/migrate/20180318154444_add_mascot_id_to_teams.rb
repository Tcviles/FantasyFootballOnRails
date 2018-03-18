class AddMascotIdToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :mascot_id, :integer
  end
end
