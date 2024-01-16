class CreateChampions < ActiveRecord::Migration[7.1]
  def change
    create_table :champions do |t|
      t.string :name
      t.float :pv
      t.float :damage
      t.float :speed
      t.float :shield

      t.timestamps
    end
  end
end
