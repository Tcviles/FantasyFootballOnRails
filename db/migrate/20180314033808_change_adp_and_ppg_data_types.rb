class ChangeAdpAndPpgDataTypes < ActiveRecord::Migration[5.1]
  def change
    change_column :players, :adp, :float
    change_column :players, :avg_fantasy_ppg, :float
  end
end
