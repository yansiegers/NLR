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

ActiveRecord::Schema[7.0].define(version: 2022_06_09_091754) do
  create_table "graph_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graphs", force: :cascade do |t|
    t.string "name"
    t.string "property"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "graph_category_id"
    t.index ["graph_category_id"], name: "index_graphs_on_graph_category_id"
  end

  create_table "graphs_workspaces", force: :cascade do |t|
    t.integer "workspace_id"
    t.integer "graph_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["graph_id"], name: "index_graphs_workspaces_on_graph_id"
    t.index ["workspace_id"], name: "index_graphs_workspaces_on_workspace_id"
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

  create_table "workspaces", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.boolean "favorite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workspaces_on_user_id"
  end

  add_foreign_key "graphs", "graph_categories"
  add_foreign_key "workspaces", "users"
end
