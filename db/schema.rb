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

ActiveRecord::Schema.define(version: 20171114044036) do

  create_table "causes", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.integer "upvotes"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.integer "upvotes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first"
    t.string "last"
    t.string "email"
    t.string "password"
    t.text "skills"
    t.text "favoriteNpos"
    t.text "favoriteBusinesses"
    t.boolean "profilePicture"
    t.integer "hoursWorked"
    t.integer "moneyRaised"
    t.text "reviews"
    t.text "currentProjects"
    t.text "applications"
    t.text "bio"
    t.text "messageThreads"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_causes", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "cause_id", null: false
    t.index ["cause_id", "user_id"], name: "index_users_causes_on_cause_id_and_user_id"
    t.index ["user_id", "cause_id"], name: "index_users_causes_on_user_id_and_cause_id"
  end

  create_table "users_skills", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.index ["skill_id", "user_id"], name: "index_users_skills_on_skill_id_and_user_id"
    t.index ["user_id", "skill_id"], name: "index_users_skills_on_user_id_and_skill_id"
  end

end
