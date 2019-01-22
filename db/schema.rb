# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_01_22_052154) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attentions", force: :cascade do |t|
    t.string "tipo_atencion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "descripcion"
    t.integer "user_id"
    t.time "hora_atencion"
    t.integer "mascota"
    t.string "cliente"
    t.string "nombre"
    t.string "nombre_mascota"
    t.integer "celular"
  end

  create_table "horarios", force: :cascade do |t|
    t.time "entrada"
    t.time "salida"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hour_reservations", force: :cascade do |t|
    t.date "fecha_reserva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "pet_id"
    t.boolean "reservada", default: false, null: false
    t.string "especialidad"
    t.time "hora_reserva"
  end

  create_table "pets", force: :cascade do |t|
    t.string "nombre"
    t.string "tipo_mascota"
    t.string "sexo"
    t.string "raza"
    t.integer "edad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "nombre_producto"
    t.string "tipo_producto"
    t.text "descripcion"
    t.integer "cantidad"
    t.date "caducidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "provider_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "nombre_proveedor"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "razon_social"
    t.string "direccion"
    t.string "email"
    t.string "giro"
    t.integer "fono"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "ap_pat"
    t.string "ap_mat"
    t.string "rut"
    t.string "direccion"
    t.integer "celular"
    t.string "comuna"
    t.string "role"
    t.boolean "activado", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "attentions", "users"
  add_foreign_key "horarios", "users"
  add_foreign_key "hour_reservations", "pets"
  add_foreign_key "hour_reservations", "users"
  add_foreign_key "pets", "users"
  add_foreign_key "products", "providers"
end
