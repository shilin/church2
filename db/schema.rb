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

ActiveRecord::Schema.define(version: 20170713085244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "name"
    t.text     "body"
    t.boolean  "postal",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "geo",        default: false
    t.index ["name"], name: "index_addresses_on_name", unique: true, using: :btree
  end

  create_table "addressings", force: :cascade do |t|
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.integer  "address_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["address_id"], name: "index_addressings_on_address_id", using: :btree
    t.index ["addressable_type", "addressable_id", "address_id"], name: "by_addressable_address", unique: true, using: :btree
    t.index ["addressable_type", "addressable_id"], name: "index_addressings_on_addressable_type_and_addressable_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color"], name: "index_categories_on_color", unique: true, using: :btree
    t.index ["name"], name: "index_categories_on_name", unique: true, using: :btree
  end

  create_table "clergymen", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.integer  "rank"
    t.date     "birth"
    t.date     "engagement"
    t.date     "wedding"
    t.date     "baptism"
    t.date     "confirmation"
    t.date     "deacon_ordination"
    t.date     "pastor_ordination"
    t.date     "bishop_installation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "congregations", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.text     "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "phones", force: :cascade do |t|
    t.string   "description"
    t.boolean  "for_public"
    t.integer  "phone_type"
    t.string   "number"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "phonings", force: :cascade do |t|
    t.string   "phonable_type"
    t.integer  "phonable_id"
    t.integer  "phone_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["phonable_id", "phonable_type", "phone_id"], name: "by_phonable_phone", unique: true, using: :btree
    t.index ["phonable_type", "phonable_id"], name: "index_phonings_on_phonable_type_and_phonable_id", using: :btree
    t.index ["phone_id"], name: "index_phonings_on_phone_id", using: :btree
  end

  create_table "qnas", force: :cascade do |t|
    t.string   "name"
    t.text     "question"
    t.text     "answer"
    t.boolean  "approved",   default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["approved"], name: "index_qnas_on_approved", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.integer  "tag_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_type", "taggable_id", "tag_id"], name: "by_taggable_tag", unique: true, using: :btree
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_tags_on_category_id", using: :btree
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

  add_foreign_key "addressings", "addresses"
  add_foreign_key "locatings", "locations"
  add_foreign_key "phonings", "phones"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "categories"
end
