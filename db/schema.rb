# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_07_121524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notebooks", force: :cascade do |t|
    t.string "bar_code"
    t.string "full_price"
    t.string "offer_price"
    t.string "brand"
    t.string "modelo"
    t.string "processor"
    t.string "color"
    t.string "screen"
    t.string "weight"
    t.string "ram"
    t.string "hd"
    t.string "ssd"
    t.string "placa_video"
    t.string "keyboard"
    t.string "amazon_sales_rank"
    t.string "guarantee"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "saved_notebooks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "notebook_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notebook_id"], name: "index_saved_notebooks_on_notebook_id"
    t.index ["user_id"], name: "index_saved_notebooks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "saved_notebooks", "notebooks"
  add_foreign_key "saved_notebooks", "users"
end
