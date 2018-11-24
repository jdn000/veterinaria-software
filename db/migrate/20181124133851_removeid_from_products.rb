class RemoveidFromProducts < ActiveRecord::Migration[5.2]
  def change
  	change_table :products do |t|
  		t.remove :id_producto
  	end
  end
end
