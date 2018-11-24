class AgregandoColumnasUser < ActiveRecord::Migration[5.2]
  def change
  	 add_column :users, :nombre, :string
  	 add_column :users, :ap_pat, :string
  	 add_column :users, :ap_mat, :string
  	 add_column :users, :rut, :string ,unique: true
  	 add_column :users, :direccion, :string
  	 add_column :users, :celular, :integer

  end
end
