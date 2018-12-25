class EliminarTablaMedicalRecord < ActiveRecord::Migration[5.2]
  def change

  	drop_table :medical_records do |t|
          t.string "tipo_atencion"
          t.string "descripcion"
          t.integer "hour_id"
          t.integer "user_id"
          t.integer "pet_id"
          t.datetime "created_at", null: false
          t.datetime "updated_at", null: false          
        end  
  end
end
