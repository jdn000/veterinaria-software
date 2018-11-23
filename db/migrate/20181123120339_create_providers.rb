class CreateProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :providers do |t|
      t.string :nombre_proveedor
      t.string :rut

      t.timestamps
    end
  end
end
