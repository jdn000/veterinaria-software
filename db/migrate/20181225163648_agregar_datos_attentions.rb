class AgregarDatosAttentions < ActiveRecord::Migration[5.2]
  def change

  	add_column :attentions, :descripcion, :string
  	add_column :attentions, :hour_id, :integer
  	add_column :attentions, :pet_id, :integer
  	add_column :attentions, :user_id, :integer
  	

  	add_foreign_key :attentions, :pets, column: :pet_id, primary_key: :id  	  
  	add_foreign_key :attentions, :users, column: :user_id, primary_key: :id    	 

	add_foreign_key :attentions, :hour_reservations, column: :hour_id, primary_key: :id 
  end
end
