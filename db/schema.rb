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

ActiveRecord::Schema[7.2].define(version: 2025_08_23_212858) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "cep"
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "cart_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity"
    t.decimal "unit_price", precision: 10, scale: 2
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["menu_item_id"], name: "index_cart_items_on_menu_item_id"
  end

  create_table "carts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_carts_on_restaurant_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_categories_on_restaurant_id"
  end

  create_table "coupon_redemptions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "order_id", null: false
    t.bigint "coupon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coupon_id"], name: "index_coupon_redemptions_on_coupon_id"
    t.index ["order_id"], name: "index_coupon_redemptions_on_order_id"
    t.index ["user_id"], name: "index_coupon_redemptions_on_user_id"
  end

  create_table "coupons", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "code"
    t.integer "discount_type"
    t.decimal "amount", precision: 10, scale: 2
    t.decimal "min_order_value", precision: 10, scale: 2
    t.bigint "restaurant_id", null: false
    t.datetime "expires_at"
    t.boolean "active", default: true
    t.integer "usage_limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_coupons_on_restaurant_id"
  end

  create_table "delivery_fee_rules", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.decimal "min_km", precision: 5, scale: 2
    t.decimal "max_km", precision: 5, scale: 2
    t.decimal "fee", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_delivery_fee_rules_on_restaurant_id"
  end

  create_table "driver_profiles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "vehicle_type"
    t.string "plate"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_driver_profiles_on_user_id"
  end

  create_table "external_service_logs", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "service"
    t.string "endpoint"
    t.string "method"
    t.integer "status_code"
    t.json "request_payload"
    t.json "response_payload"
    t.integer "duration_ms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "category_id", null: false
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10, scale: 2
    t.boolean "available"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_menu_items_on_category_id"
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "notifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.datetime "read_at"
    t.string "notifiable_type", null: false
    t.bigint "notifiable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "order_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity"
    t.decimal "unit_price", precision: 10, scale: 2
    t.decimal "total_price", precision: 10, scale: 2
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.bigint "address_id", null: false
    t.integer "status"
    t.decimal "subtotal", precision: 10, scale: 2
    t.decimal "delivery_fee", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.integer "payment_method"
    t.integer "payment_status"
    t.bigint "courier_id"
    t.integer "distance_meters"
    t.integer "eta_minutes"
    t.text "route_geometry"
    t.bigint "coupon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_orders_on_address_id"
    t.index ["coupon_id"], name: "index_orders_on_coupon_id"
    t.index ["courier_id"], name: "index_orders_on_courier_id"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_intents", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "provider"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "status"
    t.string "external_id"
    t.json "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payment_intents_on_order_id"
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.text "description"
    t.string "phone"
    t.boolean "active"
    t.time "opening_time"
    t.time "closing_time"
    t.decimal "min_order_value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_restaurants_on_user_id"
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "menu_items"
  add_foreign_key "carts", "restaurants"
  add_foreign_key "carts", "users"
  add_foreign_key "categories", "restaurants"
  add_foreign_key "coupon_redemptions", "orders"
  add_foreign_key "coupon_redemptions", "users"
  add_foreign_key "coupons", "restaurants"
  add_foreign_key "delivery_fee_rules", "restaurants"
  add_foreign_key "driver_profiles", "users"
  add_foreign_key "menu_items", "categories"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "notifications", "users"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "addresses"
  add_foreign_key "orders", "coupons"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "orders", "users", column: "courier_id"
  add_foreign_key "payment_intents", "orders"
  add_foreign_key "restaurants", "users"
  add_foreign_key "reviews", "users"
end
