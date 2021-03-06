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

ActiveRecord::Schema.define(version: 2020_03_17_155006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emails", force: :cascade do |t|
    t.string "subject"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails_searches", id: false, force: :cascade do |t|
    t.bigint "email_id"
    t.bigint "search_id"
    t.index ["email_id"], name: "index_emails_searches_on_email_id"
    t.index ["search_id"], name: "index_emails_searches_on_search_id"
  end

  create_table "recipient_user_emails", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_recipient_user_emails_on_email_id"
    t.index ["user_id"], name: "index_recipient_user_emails_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sender_user_emails", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_sender_user_emails_on_email_id"
    t.index ["user_id"], name: "index_sender_user_emails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "recipient_user_emails", "emails"
  add_foreign_key "recipient_user_emails", "users"
  add_foreign_key "sender_user_emails", "emails"
  add_foreign_key "sender_user_emails", "users"
end
