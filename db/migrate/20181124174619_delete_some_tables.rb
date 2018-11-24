class DeleteSomeTables < ActiveRecord::Migration[5.2]
  	def change


          drop_table :attention do |t|
          t.string "tipo_atencion"
          t.text "comentarios"
          end

        drop_table :medicalrecord do |t|
        end        
        drop_table :pet do |t|
          t.string "nombre"
          t.string "tipo_mascota"
          t.string "sexo"
          t.string "raza"
          t.integer "edad"          
          t.text "comentarios"
        end        
        drop_table :provide do |t|
  	    t.string "nombre_proveedor"
  	    t.string "rut"
  	    t.string "razon_social"
  	    t.string "direccion"
        t.string "email"
 	    t.string "giro"
 	    t.integer "fono"
        end        
        drop_table "usuarios", force: :cascade do |t|
 	    t.string "email", default: "", null: false
        t.string "encrypted_password", default: "", null: false
        t.string "reset_password_token"
        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"
        t.datetime "created_at", null: false
        t.datetime "updated_at", null: false
        end
end

end
