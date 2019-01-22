class CambioComentarioAText < ActiveRecord::Migration[5.2]
  def change
  	change_column :attentions, :descripcion, :text 
  end
end
