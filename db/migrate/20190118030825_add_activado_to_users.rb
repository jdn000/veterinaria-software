class AddActivadoToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :activado, :boolean, default: true
  end
end
