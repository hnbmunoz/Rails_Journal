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

ActiveRecord::Schema[7.0].define(version: 2023_03_19_090606) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.string "AccountType"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "user_ID"
    t.integer "account_type_ID"
    t.string "username"
    t.string "password"
    t.text "authentication_token"
  end

  create_table "categories", force: :cascade do |t|
    t.integer "account_ID"
    t.string "title"
    t.text "annotations"
  end

  create_table "journals", force: :cascade do |t|
    t.integer "account_ID"
    t.string "journal_name"
    t.string "hex"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer "account_ID"
    t.integer "category_ID"
    t.string "title"
    t.text "details"
    t.datetime "created"
    t.datetime "deadline"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "user_mail"
  end

end
