class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :pokemon_type
      t.float :size
      t.float :weight
      t.datetime :date_capture

      t.timestamps
    end
  end
end
