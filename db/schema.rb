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

ActiveRecord::Schema.define(version: 2019_11_09_180923) do

  create_table "batches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.bigint "shade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shade_id"], name: "index_batches_on_shade_id"
  end

  create_table "branches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_ingredients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "feed_id"
    t.bigint "ingredient_id"
    t.decimal "price_per_unit", precision: 40, scale: 5
    t.decimal "feed_formulation_quantity", precision: 40, scale: 5
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feed_id"], name: "index_feed_ingredients_on_feed_id"
    t.index ["ingredient_id"], name: "index_feed_ingredients_on_ingredient_id"
  end

  create_table "feeds", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
    t.integer "total_chickens"
    t.decimal "feed_quantity_per_chicken", precision: 40, scale: 5
    t.bigint "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "days"
    t.index ["batch_id"], name: "index_feeds_on_batch_id"
  end

  create_table "ingredients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "stock_quantity", precision: 40, scale: 5, default: "0.0"
    t.decimal "feed_formulation_quantity", precision: 40, scale: 5, default: "0.0"
    t.decimal "last_purchased_price_per_unit", precision: 40, scale: 5, default: "0.0"
  end

  create_table "purchases", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "quantity", precision: 40, scale: 5
    t.decimal "price_per_unit", precision: 40, scale: 5
    t.date "date"
    t.bigint "ingredient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ingredient_id"], name: "index_purchases_on_ingredient_id"
  end

  create_table "shades", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_shades_on_branch_id"
  end

  add_foreign_key "batches", "shades"
  add_foreign_key "feed_ingredients", "feeds"
  add_foreign_key "feed_ingredients", "ingredients"
  add_foreign_key "feeds", "batches"
  add_foreign_key "purchases", "ingredients"
  add_foreign_key "shades", "branches"
end
