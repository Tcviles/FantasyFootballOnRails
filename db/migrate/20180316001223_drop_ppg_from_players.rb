class DropPpgFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :ppg
  end
end
