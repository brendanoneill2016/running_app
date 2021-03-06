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

ActiveRecord::Schema.define(version: 20180602152748) do

  create_table "events", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "title"
    t.string "pace"
    t.string "distance"
    t.string "google_maps"
    t.string "other_info"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", nil], name: "index_registrations_on_event_id_and_user_id"
    t.index ["event_id"], name: "index_registrations_on_event_id"
  end

  create_table "runs", force: :cascade do |t|
    t.string "date"
    t.string "time"
    t.string "meetup_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "signups", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "event_id"
    t.index ["event_id"], name: "index_signups_on_event_id"
    t.index ["user_id"], name: "index_signups_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.string "pin"
    t.string "surname"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
