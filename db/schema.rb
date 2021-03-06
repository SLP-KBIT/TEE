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

ActiveRecord::Schema.define(version: 20170123211559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contests", force: :cascade do |t|
    t.string   "title",                      null: false
    t.datetime "start_at",                   null: false
    t.datetime "end_at",                     null: false
    t.boolean  "is_active",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "players", force: :cascade do |t|
    t.boolean  "is_active",  default: true, null: false
    t.string   "name",                      null: false
    t.integer  "role",       default: 0,    null: false
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["team_id"], name: "index_players_on_team_id", using: :btree
    t.index ["user_id"], name: "index_players_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "content",    null: false
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_questions_on_subject_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "title",      null: false
    t.text     "detail",     null: false
    t.integer  "contest_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_subjects_on_contest_id", using: :btree
  end

  create_table "submissions", force: :cascade do |t|
    t.text     "code",        null: false
    t.integer  "player_id"
    t.integer  "question_id"
    t.integer  "status",      null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["player_id"], name: "index_submissions_on_player_id", using: :btree
    t.index ["question_id"], name: "index_submissions_on_question_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "contest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contest_id"], name: "index_teams_on_contest_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.boolean  "is_admin",               default: false, null: false
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

  add_foreign_key "players", "teams"
  add_foreign_key "players", "users"
  add_foreign_key "questions", "subjects"
  add_foreign_key "subjects", "contests"
  add_foreign_key "submissions", "players"
  add_foreign_key "submissions", "questions"
end
