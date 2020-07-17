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

ActiveRecord::Schema.define(version: 2020_07_17_203525) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "city", null: false
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.boolean "dojo_flag", default: false
    t.boolean "current_dojo_flag", default: false
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", limit: 10
    t.string "email"
    t.string "website"
    t.text "notes"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_contacts_on_address_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "heading"
    t.string "subheading"
    t.string "description"
    t.integer "index", null: false
    t.boolean "display", default: false
    t.integer "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_contents_on_page_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "name", null: false
    t.string "link", null: false
    t.string "image_link", null: false
    t.integer "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_links_on_content_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.string "index", limit: 2, null: false
    t.boolean "active", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.string "site_name", null: false
    t.string "site_link", null: false
    t.string "image_link", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_media_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", limit: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "users"
    t.string "password_digest"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.datetime "last_login"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
  end

end
