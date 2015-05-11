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

ActiveRecord::Schema.define(version: 20150504004848) do

  create_table "game_types", force: :cascade do |t|
    t.string   "game_type_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer  "game_type_id"
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.datetime "game_started"
    t.datetime "game_ended"
    t.string   "game_data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.integer  "initiating_player"
    t.integer  "recipient_player"
    t.integer  "game_type_id"
    t.boolean  "was_random_match"
    t.datetime "challenge_issued"
    t.datetime "challenge_expires"
    t.datetime "challenge_responded"
    t.boolean  "was_accepted"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "player_game_types", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "game_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
