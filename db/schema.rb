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

ActiveRecord::Schema.define(version: 20140413170854) do

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "complexities", force: true do |t|
    t.string   "title"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cooking_times", force: true do |t|
    t.string   "title"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredient_items", force: true do |t|
    t.decimal  "qty"
    t.integer  "ingredient_id"
    t.integer  "measure_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ingredient_list_id"
  end

  add_index "ingredient_items", ["ingredient_id"], name: "index_ingredient_items_on_ingredient_id"
  add_index "ingredient_items", ["ingredient_list_id"], name: "index_ingredient_items_on_ingredient_list_id"
  add_index "ingredient_items", ["measure_id"], name: "index_ingredient_items_on_measure_id"

  create_table "ingredient_lists", force: true do |t|
    t.string   "name"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredient_lists", ["recipe_id"], name: "index_ingredient_lists_on_recipe_id"

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ingredients", ["name"], name: "index_ingredients_on_name", unique: true

  create_table "measures", force: true do |t|
    t.string   "name"
    t.string   "val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_parts", force: true do |t|
    t.string   "image"
    t.text     "description"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_parts", ["recipe_id"], name: "index_recipe_parts_on_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.boolean  "is_draft"
    t.boolean  "is_checked"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "complexity_id"
    t.integer  "cooking_time_id"
    t.time     "cook_time"
  end

  add_index "recipes", ["complexity_id"], name: "index_recipes_on_complexity_id"
  add_index "recipes", ["cooking_time_id"], name: "index_recipes_on_cooking_time_id"

  create_table "recipes_categories", force: true do |t|
    t.integer  "recipe_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipes_categories", ["category_id"], name: "index_recipes_categories_on_category_id"
  add_index "recipes_categories", ["recipe_id"], name: "index_recipes_categories_on_recipe_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
