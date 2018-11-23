class AgregandoLlavesForaneas < ActiveRecord::Migration[5.2]
  def change
  	     add_column :medical_records, :pet_id, :integer
  	     add_column :medical_records, :user_id, :integer  
  	     add_column :hour_reservations, :user_id, :integer 
  	     add_column :hour_reservations, :pet_id, :integer 
  	     add_column :products, :provider_id, :integer
  	     add_column :pets, :user_id, :integer 
  	      
#  	     add_foreign_key :medical_records, :attentions, column: :attention_id, primary_key: :id
  	  	 add_foreign_key :medical_records, :pets, column: :pet_id, primary_key: :id  	  
  	  	 add_foreign_key :medical_records, :users, column: :user_id, primary_key: :id    	  	 	 
#  	  	 add_foreign_key :attentions, :products, column: :product_id, primary_key: :id
  	  	 add_foreign_key :hour_reservations, :users, column: :user_id, primary_key: :id  
   	  	 add_foreign_key :hour_reservations, :pets, column: :pet_id, primary_key: :id 
   	  	 add_foreign_key :products, :providers, column: :provider_id, primary_key: :id 
   	  	 add_foreign_key :pets, :users, column: :user_id, primary_key: :id 
   	  	 
   	  	    	  	 	  	 
  end
end
