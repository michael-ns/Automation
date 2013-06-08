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

ActiveRecord::Schema.define(version: 20130608041206) do

  create_table "addresses", force: true do |t|
    t.string   "billing_country"
    t.string   "billing_address"
    t.string   "billing_suburb"
    t.boolean  "shipping_same_as_billing"
    t.string   "shipping_country"
    t.string   "shipping_address"
    t.string   "shipping_suburb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "features", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "url"
    t.integer  "quantity"
    t.boolean  "gift_wrap"
    t.boolean  "is_cpr"
    t.string   "type"
    t.string   "size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promos", force: true do |t|
    t.string   "redeem_page"
    t.boolean  "has_coupon"
    t.string   "coupon_code"
    t.string   "coupon_type"
    t.string   "coupon_discount_type"
    t.float    "coupon_discount_value"
    t.boolean  "has_gift_card"
    t.string   "gift_card_code"
    t.float    "gift_card_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_cases", force: true do |t|
    t.string   "name"
    t.integer  "suite_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "promo_id"
    t.integer  "address_id"
    t.boolean  "mailcall"
  end

  create_table "test_suites", force: true do |t|
    t.string   "name"
    t.integer  "feature_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
