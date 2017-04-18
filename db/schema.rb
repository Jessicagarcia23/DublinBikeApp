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

ActiveRecord::Schema.define(version: 20170416221221) do

  create_table "customers", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "customer_id"
    t.boolean  "admin"
  end

  add_index "customers", ["customer_id"], name: "index_customers_on_customer_id"
  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true

  create_table "orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "customer_id"
    t.integer  "product_id"
    t.string   "email"
    t.date     "start_date"
    t.integer  "days"
    t.decimal  "Total_Price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["order_id"], name: "index_orders_on_order_id"

  create_table "products", force: :cascade do |t|
    t.string   "product_id"
    t.string   "description"
    t.decimal  "rental_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_url"
    t.string   "product_type"
  end

  add_index "products", ["product_id"], name: "index_products_on_product_id"

  create_table "profiles", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "profiles", ["customer_id"], name: "index_profiles_on_customer_id"

end
