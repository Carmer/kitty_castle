# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160302161524) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "castles", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kitties", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "lives"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "status"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "kitty_id"
    t.integer  "castle_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "credit_card_number"
  end

  add_index "reservations", ["castle_id"], name: "index_reservations_on_castle_id", using: :btree
  add_index "reservations", ["kitty_id"], name: "index_reservations_on_kitty_id", using: :btree

  add_foreign_key "reservations", "castles"
  add_foreign_key "reservations", "kitties"
end
