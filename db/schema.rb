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

ActiveRecord::Schema.define(version: 2020_09_06_003931) do

  create_table "addresses", force: :cascade do |t|
    t.string "location_name", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "city", null: false
    t.string "zip_code", null: false
    t.integer "event_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "state_id"
    t.index ["event_id"], name: "index_addresses_on_event_id"
    t.index ["state_id"], name: "index_addresses_on_state_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "announcements", force: :cascade do |t|
    t.string "heading", null: false
    t.text "description"
    t.text "link"
    t.boolean "pinned", default: false
    t.boolean "archived", default: false
    t.integer "page_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_announcements_on_page_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "heading", null: false
    t.string "subheading"
    t.text "description"
    t.integer "index"
    t.boolean "display_content_on_page", default: false
    t.boolean "article", default: false
    t.integer "page_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_id"], name: "index_contents_on_page_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.boolean "display", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "page_id"
    t.index ["page_id"], name: "index_events_on_page_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "pdf_file_name"
    t.string "pdf_content_type"
    t.bigint "pdf_file_size"
    t.datetime "pdf_updated_at"
    t.integer "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_file_uploads_on_announcement_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "content_id"
    t.integer "announcement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["announcement_id"], name: "index_images_on_announcement_id"
    t.index ["content_id"], name: "index_images_on_content_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "name", null: false
    t.string "link", null: false
    t.integer "index", null: false
    t.boolean "article", default: false
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["content_id"], name: "index_links_on_content_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "name", null: false
    t.string "path", null: false
    t.string "admin_path", null: false
    t.string "index", limit: 2, null: false
    t.boolean "active", default: true
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "day_of_week", null: false
    t.integer "day_of_week_index", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "cost_per_month", null: false
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_practices_on_content_id"
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.string "site_name", null: false
    t.string "site_link", null: false
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
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
    t.boolean "new_user", default: true
  end

end
