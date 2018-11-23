class CreateHourReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :hour_reservations do |t|
      t.date :fecha_reserva

      t.timestamps
    end
  end
end
