class ReparandoAttentions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :attentions, :hour_id, :integer
  	remove_column :attentions, :pet_id, :integer

  	add_column :attentions, :hora_atencion, :time 
  	add_column :attentions, :mascota, :integer 
  	add_column :attentions, :cliente, :integer  	  
  end
end
