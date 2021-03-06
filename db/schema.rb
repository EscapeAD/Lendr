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

ActiveRecord::Schema.define(version: 20161011205439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "checkouts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "due_date"
    t.datetime "start_date"
    t.boolean  "returned",      default: false
    t.datetime "returned_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "check_initial", default: false
    t.index ["item_id"], name: "index_checkouts_on_item_id", using: :btree
    t.index ["user_id"], name: "index_checkouts_on_user_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "mailboxes", force: :cascade do |t|
    t.string   "title"
    t.integer  "sender"
    t.integer  "recipient"
    t.text     "text"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "unread",     default: true
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "verification_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
    t.index ["verification_id"], name: "index_messages_on_verification_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "item_id"
    t.index ["item_id"], name: "index_pictures_on_item_id", using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.integer  "checkout_id"
    t.text     "story"
    t.datetime "date"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "completed",   default: false
    t.index ["checkout_id"], name: "index_stories_on_checkout_id", using: :btree
  end

  create_table "story_photos", force: :cascade do |t|
    t.integer  "story_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["story_id"], name: "index_story_photos_on_story_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "verifications", force: :cascade do |t|
    t.integer  "checkout_id"
    t.string   "status"
    t.boolean  "owner"
    t.boolean  "borrower"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "meetup_location"
    t.index ["checkout_id"], name: "index_verifications_on_checkout_id", using: :btree
  end

  add_foreign_key "checkouts", "items"
  add_foreign_key "checkouts", "users"
  add_foreign_key "items", "categories"
  add_foreign_key "messages", "verifications"
  add_foreign_key "pictures", "items"
  add_foreign_key "stories", "checkouts"
  add_foreign_key "verifications", "checkouts"
end
