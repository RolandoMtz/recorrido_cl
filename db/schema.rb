# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_23_170025) do

  create_table "availabilities", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "semana", null: false
    t.integer "anio", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_availabilities_on_service_id"
  end

  create_table "availability_details", force: :cascade do |t|
    t.integer "availability_id", null: false
    t.date "fecha"
    t.time "hora_inicio"
    t.integer "engineer_availability_id", null: false
    t.boolean "disponible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_availability_details_on_availability_id"
    t.index ["engineer_availability_id"], name: "index_availability_details_on_engineer_availability_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer "service_id", null: false
    t.integer "dia", null: false
    t.time "hora_inicio", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_contracts_on_service_id"
  end

  create_table "engineer_availabilities", force: :cascade do |t|
    t.string "nombre"
    t.integer "disponibilidad", default: 0
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "availabilities", "services"
  add_foreign_key "availability_details", "availabilities"
  add_foreign_key "availability_details", "engineer_availabilities"
  add_foreign_key "contracts", "services"
end
