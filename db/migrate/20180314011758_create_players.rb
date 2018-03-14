class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :nfl_team
      t.integer :adp
      t.integer :position_id
      t.integer :avg_fantasy_ppg

      t.timestamps null: false
    end
  end
end
