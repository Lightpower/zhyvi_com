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

ActiveRecord::Schema.define(version: 20131113145600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: true do |t|
    t.string   "type",        default: "Article"
    t.string   "title"
    t.text     "preview"
    t.text     "data"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "articles", ["category_id"], name: "index_articles_on_category_id", using: :btree
  add_index "articles", ["type"], name: "index_articles_on_type", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "type",       default: "Event", null: false
    t.string   "title"
    t.text     "preview"
    t.text     "data"
    t.datetime "start_at",                     null: false
    t.datetime "finish_at"
    t.integer  "user_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "color"
  end

  add_index "events", ["finish_at"], name: "index_events_on_finish_at", using: :btree
  add_index "events", ["start_at"], name: "index_events_on_start_at", using: :btree
  add_index "events", ["type"], name: "index_events_on_type", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "event_id",                     null: false
    t.integer  "user_id",                      null: false
    t.integer  "file_link_id"
    t.text     "data"
    t.boolean  "selected",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["event_id"], name: "index_feedbacks_on_event_id", using: :btree
  add_index "feedbacks", ["file_link_id"], name: "index_feedbacks_on_file_link_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "file_links", force: true do |t|
    t.string   "type",       null: false
    t.string   "url",        null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "file_links", ["type"], name: "index_file_links_on_type", using: :btree
  add_index "file_links", ["user_id"], name: "index_file_links_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "role",                   default: ""
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
