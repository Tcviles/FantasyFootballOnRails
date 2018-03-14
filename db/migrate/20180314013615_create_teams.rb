class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :league_id
      t.integer :user_id

      t.timestamps
    end
  end
end
