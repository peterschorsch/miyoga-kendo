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

ActiveRecord::Schema[7.0].define(version: 2023_03_10_221808) do
  create_table "addresses", force: :cascade do |t|
    t.string "location_name", null: false
    t.string "address_line_1", null: false
    t.string "address_line_2"
    t.string "city", null: false
    t.string "zip_code", null: false
    t.text "notes"
    t.boolean "archived", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "state_id"
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["page_id"], name: "index_announcements_on_page_id"
    t.index ["user_id"], name: "index_announcements_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "heading", null: false
    t.string "subheading"
    t.text "description"
    t.integer "index"
    t.boolean "archived", default: false
    t.boolean "article", default: false
    t.integer "page_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["page_id"], name: "index_contents_on_page_id"
    t.index ["user_id"], name: "index_contents_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.boolean "display", default: true
    t.integer "address_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "page_id"
    t.index ["address_id"], name: "index_events_on_address_id"
    t.index ["page_id"], name: "index_events_on_page_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "pdf_file_name"
    t.string "pdf_content_type"
    t.bigint "pdf_file_size"
    t.datetime "pdf_updated_at", precision: nil
    t.integer "announcement_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["announcement_id"], name: "index_file_uploads_on_announcement_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer "content_id"
    t.integer "announcement_id"
    t.integer "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "link_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["address_id"], name: "index_images_on_address_id"
    t.index ["announcement_id"], name: "index_images_on_announcement_id"
    t.index ["content_id"], name: "index_images_on_content_id"
    t.index ["link_id"], name: "index_images_on_link_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "name", null: false
    t.string "link", null: false
    t.integer "index", null: false
    t.boolean "article", default: false
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["user_id"], name: "index_pages_on_user_id"
  end

  create_table "practices", force: :cascade do |t|
    t.string "day_of_week", null: false
    t.integer "day_of_week_index", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.string "cost_per_month", null: false
    t.text "notes"
    t.integer "content_id"
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["content_id"], name: "index_practices_on_content_id"
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "social_media", force: :cascade do |t|
    t.string "site_name", null: false
    t.string "site_link", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.bigint "image_file_size"
    t.datetime "image_updated_at"
    t.index ["user_id"], name: "index_social_media_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name", null: false
    t.string "abbreviation", limit: 2, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "email", null: false
    t.string "users"
    t.string "password_digest"
    t.boolean "active", default: true
    t.boolean "dojo_account", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "role"
    t.datetime "last_login", precision: nil
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.boolean "new_user", default: true
  end

  add_foreign_key "addresses", "states"
  add_foreign_key "addresses", "users"
  add_foreign_key "announcements", "pages"
  add_foreign_key "announcements", "users"
  add_foreign_key "contents", "pages"
  add_foreign_key "contents", "users"
  add_foreign_key "events", "addresses"
  add_foreign_key "events", "users"
  add_foreign_key "file_uploads", "announcements"
  add_foreign_key "images", "addresses"
  add_foreign_key "images", "announcements"
  add_foreign_key "images", "contents"
  add_foreign_key "links", "contents"
  add_foreign_key "links", "users"
  add_foreign_key "pages", "users"
  add_foreign_key "practices", "contents"
  add_foreign_key "practices", "users"
  add_foreign_key "social_media", "users"
end
