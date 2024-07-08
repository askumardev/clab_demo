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

ActiveRecord::Schema[7.2].define(version: 2024_07_08_170058) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excavators", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "excavator_type"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "field_contact_name"
    t.string "field_contact_phone"
    t.string "field_contact_email"
    t.boolean "crew_onsite"
    t.bigint "ticket_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_excavators_on_ticket_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.string "reference_request_number"
    t.integer "version_number"
    t.integer "sequence_number"
    t.string "request_type"
    t.string "request_action"
    t.datetime "request_taken_at"
    t.datetime "legal_at"
    t.datetime "response_due_at"
    t.datetime "restake_at"
    t.datetime "expiration_at"
    t.string "primary_service_area_code"
    t.text "additional_service_area_codes"
    t.string "type_of_work"
    t.string "work_done_for"
    t.string "project_duration"
    t.datetime "project_start_date"
    t.boolean "explosives"
    t.string "underground_overhead"
    t.string "horizontal_boring"
    t.boolean "whitelined"
    t.text "locate_instructions"
    t.text "remarks"
    t.text "digsite_info"
    t.text "well_known_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "excavators", "tickets"
  add_foreign_key "messages", "users"
  add_foreign_key "posts", "users"
end
