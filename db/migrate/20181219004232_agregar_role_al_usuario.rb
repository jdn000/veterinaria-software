class AgregarRoleAlUsuario < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :rol,:string
  	add_column :users, :role,:string
  end
end
