class AgregandoLlavesForaneas < ActiveRecord::Migration[5.2]
  def change
  	     add_column :hour_reservations, :user_id, :integer 
  	     add_column :hour_reservations, :pet_id, :integer 
  	     add_column :pets, :user_id, :integer 
  	      
  	  	 add_foreign_key :hour_reservations, :users, column: :user_id, primary_key: :id  
   	  	 add_foreign_key :hour_reservations, :pets, column: :pet_id, primary_key: :id 
   	  	 add_foreign_key :pets, :users, column: :user_id, primary_key: :id 
   	  	 
   	  	    	  	 	  	 
  end
end
