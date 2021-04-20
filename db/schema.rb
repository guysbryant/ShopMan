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

ActiveRecord::Schema.define(version: 2021_04_09_214137) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_name"
    t.integer "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "part_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_number_trackers", force: :cascade do |t|
    t.integer "sales_number", default: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_order_lines", force: :cascade do |t|
    t.integer "product_id"
    t.integer "sales_order_id"
    t.integer "qty"
    t.integer "price"
    t.integer "line_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_order_lines_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_lines_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.integer "sales_order_number"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_lines", default: 0
    t.integer "sales_number_tracker_id"
    t.index ["customer_id"], name: "index_sales_orders_on_customer_id"
    t.index ["sales_number_tracker_id"], name: "index_sales_orders_on_sales_number_tracker_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "address"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
