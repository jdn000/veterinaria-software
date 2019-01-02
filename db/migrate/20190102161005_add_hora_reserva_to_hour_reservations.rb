class AddHoraReservaToHourReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :hour_reservations, :hora_reserva, :time
  end
end
