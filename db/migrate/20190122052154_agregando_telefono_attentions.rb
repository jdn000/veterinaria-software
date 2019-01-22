class AgregandoTelefonoAttentions < ActiveRecord::Migration[5.2]
  def change
  	  add_column :attentions, :celular, :integer 

  end
end
