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

ActiveRecord::Schema.define(version: 20160130000255) do

  create_table "accounts", force: :cascade do |t|
    t.string   "username",        limit: 255
    t.string   "password_digest", limit: 255
    t.integer  "role_id",         limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "accounts", ["role_id"], name: "index_accounts_on_role_id", using: :btree
  add_index "accounts", ["username"], name: "index_accounts_on_username", unique: true, using: :btree

  create_table "accounts_to_tokens_catalogs", force: :cascade do |t|
    t.integer  "token_id",   limit: 4
    t.integer  "account_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "accounts_to_tokens_catalogs", ["account_id"], name: "index_accounts_to_tokens_catalogs_on_account_id", using: :btree
  add_index "accounts_to_tokens_catalogs", ["token_id"], name: "index_accounts_to_tokens_catalogs_on_token_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "roles", ["name"], name: "index_roles_on_name", unique: true, using: :btree

  create_table "tokens", force: :cascade do |t|
    t.string   "uuid",            limit: 255
    t.datetime "expiration_date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "tokens", ["uuid"], name: "index_tokens_on_uuid", unique: true, using: :btree

  add_foreign_key "accounts", "roles"
  add_foreign_key "accounts_to_tokens_catalogs", "accounts"
  add_foreign_key "accounts_to_tokens_catalogs", "tokens"
end
