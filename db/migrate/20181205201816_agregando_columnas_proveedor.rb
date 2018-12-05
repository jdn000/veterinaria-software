class AgregandoColumnasProveedor < ActiveRecord::Migration[5.2]
  def change
  	add_column :providers, :razon_social, :string
  	add_column :providers, :direccion, :string
  	add_column :providers, :email, :string
  	add_column :providers, :giro, :string
  	add_column :providers, :fono, :integer
  end
end
