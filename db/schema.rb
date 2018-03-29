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

ActiveRecord::Schema.define(version: 20180329144144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "icos", force: :cascade do |t|
    t.string "name"
    t.decimal "percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_icos", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "ico_id"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ico_id"], name: "index_user_icos_on_ico_id"
    t.index ["user_id"], name: "index_user_icos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ext_id"
    t.string "name"
    t.decimal "start_deposit"
    t.decimal "total_deposit"
    t.decimal "total_cashout"
    t.decimal "ico"
    t.decimal "crypto"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
