# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160601093356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exams", force: :cascade do |t|
    t.date     "exam_date"
    t.integer  "score_right"
    t.integer  "score_left"
    t.integer  "score_total"
    t.string   "recommendation"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "exams", ["user_id"], name: "index_exams_on_user_id", using: :btree

  create_table "prescriptions", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "exam_id"
    t.integer  "user_id"
    t.string   "status",               default: "Pending"
    t.string   "ophtalmo_score_left"
    t.string   "ophtalmo_score_right"
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "position"
    t.integer  "orientation"
    t.integer  "size"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "description"
    t.integer  "rating"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "user_answers", force: :cascade do |t|
    t.integer  "answered_orientation"
    t.integer  "question_id"
    t.integer  "exam_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_answers", ["exam_id"], name: "index_user_answers_on_exam_id", using: :btree
  add_index "user_answers", ["question_id"], name: "index_user_answers_on_question_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.date     "date_of_birth"
    t.float    "shoe_size"
    t.string   "phone_number"
    t.boolean  "pregnant"
    t.boolean  "chronic_health_conditions"
    t.boolean  "current_pain"
    t.boolean  "eye_surgery"
    t.string   "gender"
    t.string   "wearing_on_now"
    t.string   "worn_in_past"
    t.boolean  "ophtalmo"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "exams", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "user_answers", "exams"
  add_foreign_key "user_answers", "questions"
end
