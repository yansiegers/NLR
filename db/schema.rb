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

ActiveRecord::Schema[7.0].define(version: 2022_06_05_134136) do
  create_table "bookmarks", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "graph_bookmarks", force: :cascade do |t|
    t.integer "graph_id", null: false
    t.integer "bookmark_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookmark_id"], name: "index_graph_bookmarks_on_bookmark_id"
    t.index ["graph_id"], name: "index_graph_bookmarks_on_graph_id"
  end

  create_table "graphs", force: :cascade do |t|
    t.string "name"
    t.string "property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "measuring_points", force: :cascade do |t|
    t.string "property"
    t.integer "timestamp"
    t.decimal "value", precision: 15, scale: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email", default: "", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "users"
  add_foreign_key "graph_bookmarks", "bookmarks"
  add_foreign_key "graph_bookmarks", "graphs"
end
