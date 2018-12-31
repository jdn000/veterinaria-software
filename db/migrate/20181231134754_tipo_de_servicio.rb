class TipoDeServicio < ActiveRecord::Migration[5.2]
  def change
  	  	add_column :hour_reservations, :especialidad ,:string
  end
end
