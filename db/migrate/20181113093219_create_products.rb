class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :id_producto
      t.string :nombre_producto
      t.string :tipo_producto
      t.text :descripcion
      t.integer :cantidad
      t.date :caducidad

      t.timestamps
    end
  end
end
