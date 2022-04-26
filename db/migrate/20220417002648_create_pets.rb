class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.float :weight
      t.string :species
      t.string :race

      t.timestamps
    end
  end
end
