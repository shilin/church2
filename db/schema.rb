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

ActiveRecord::Schema.define(version: 20170102143145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locatings", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "locatable_type"
    t.integer  "locatable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["locatable_type", "locatable_id", "location_id"], name: "by_locatable_location", unique: true, using: :btree
    t.index ["locatable_type", "locatable_id"], name: "index_locatings_on_locatable_type_and_locatable_id", using: :btree
    t.index ["location_id"], name: "index_locatings_on_location_id", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_locations_on_name", unique: true, using: :btree
  end

  create_table "news_items", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.text     "body_preview"
    t.date     "unpin_date"
    t.string   "image_url"
    t.string   "preview_image_url"
    t.boolean  "approved",          default: false
    t.integer  "zoom",              default: 0
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["zoom"], name: "index_news_items_on_zoom", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                  default: false, null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "zoom_limits", force: :cascade do |t|
    t.integer  "zoom",       default: 0
    t.integer  "limit"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["zoom"], name: "index_zoom_limits_on_zoom", unique: true, using: :btree
  end

  add_foreign_key "locatings", "locations"
end
