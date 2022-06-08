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

ActiveRecord::Schema[7.0].define(version: 2022_05_18_121023) do
  create_table "bookmarks", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "bookmarks_graphs", force: :cascade do |t|
    t.integer "bookmark_id"
    t.integer "graph_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookmark_id"], name: "index_bookmarks_graphs_on_bookmark_id"
    t.index ["graph_id"], name: "index_bookmarks_graphs_on_graph_id"
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
    t.string "email_address"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookmarks", "users"
end
