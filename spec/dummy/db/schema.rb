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

ActiveRecord::Schema.define(version: 4) do

  create_table "cars", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "type"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.string "group_type"
    t.integer "group_id"
    t.string "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type", "name", "group_id", "group_type"], name: "index_preferences_on_owner_and_name_and_preference", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "login", null: false
  end

end
