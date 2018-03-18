class CreateMascots < ActiveRecord::Migration[5.1]
  def change
    create_table :mascots do |t|
      t.string :name
      t.string :color
      t.string :motto

      t.timestamps
    end
  end
end
