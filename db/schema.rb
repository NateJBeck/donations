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

ActiveRecord::Schema.define(version: 20141118145559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: true do |t|
    t.integer  "charity_id", null: false
    t.integer  "town_id",    null: false
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["charity_id", "town_id", "date"], name: "index_availabilities_on_charity_id_and_town_id_and_date", unique: true, using: :btree
  add_index "availabilities", ["charity_id", "town_id"], name: "index_availabilities_on_charity_id_and_town_id", using: :btree

  create_table "charities", force: true do |t|
    t.string "name",     null: false
    t.text   "info",     null: false
    t.string "logo_url", null: false
  end

  create_table "pickup_dates", force: true do |t|
    t.date     "date",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "charity_id"
  end

  create_table "towns", force: true do |t|
    t.string   "name",       null: false
    t.string   "zipcode",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "charity_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "charity_id"
    t.boolean  "admin",           default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
