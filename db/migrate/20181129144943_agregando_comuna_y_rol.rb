class AgregandoComunaYRol < ActiveRecord::Migration[5.2]
  def change
  	  	 add_column :users, :comuna, :string
  	  	 add_column :users, :rol, :string
  end
end
