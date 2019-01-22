class NombreAttention < ActiveRecord::Migration[5.2]
  def change
  	add_column :attentions, :nombre, :string 
  end
end
