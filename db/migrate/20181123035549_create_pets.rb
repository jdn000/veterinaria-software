class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :nombre
      t.string :tipo_mascota
      t.string :sexo
      t.string :raza
      t.integer :edad

      t.timestamps
    end
  end
end
