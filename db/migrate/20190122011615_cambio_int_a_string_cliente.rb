class CambioIntAStringCliente < ActiveRecord::Migration[5.2]
  def change
  	change_column :attentions, :cliente, :string 
  end
end
