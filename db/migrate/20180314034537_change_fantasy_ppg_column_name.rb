class ChangeFantasyPpgColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :players, :avg_fantasy_ppg, :ppg
  end
end
