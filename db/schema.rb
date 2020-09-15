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

ActiveRecord::Schema.define(version: 20200914082918) do

  create_table "agoods", force: :cascade do |t|
    t.integer "answer_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_agoods_on_answer_id"
    t.index ["user_id"], name: "index_agoods_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "body", limit: 1000
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "authorized", default: false, null: false
    t.integer "question_id"
    t.integer "user_id"
    t.integer "calm_score_sum", default: 0, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "bars", force: :cascade do |t|
    t.integer "page", null: false
    t.integer "score", null: false
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_bars_on_lesson_id"
  end

  create_table "calms", force: :cascade do |t|
    t.integer "calm_score"
    t.integer "scream_id"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_calms_on_answer_id"
    t.index ["scream_id"], name: "index_calms_on_scream_id"
  end

  create_table "cgoods", force: :cascade do |t|
    t.integer "comment_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_cgoods_on_comment_id"
    t.index ["user_id"], name: "index_cgoods_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "body", limit: 1000, null: false
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "answer_id"
    t.index ["answer_id"], name: "index_comments_on_answer_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "course_files", force: :cascade do |t|
    t.string "title"
    t.string "filename"
    t.string "comment"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_files_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lesson_files", force: :cascade do |t|
    t.string "title"
    t.string "filename"
    t.string "comment"
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id", "created_at"], name: "index_lesson_files_on_lesson_id_and_created_at"
    t.index ["lesson_id"], name: "index_lesson_files_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title", limit: 100
    t.string "body", limit: 1000
    t.string "file_path", limit: 2083
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "metoos", force: :cascade do |t|
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_metoos_on_question_id"
    t.index ["user_id"], name: "index_metoos_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.string "body", limit: 1000, null: false
    t.integer "metoo", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "solved", default: false, null: false
    t.integer "lesson_id"
    t.integer "user_id"
    t.integer "rided_score_sum", default: 0, null: false
    t.integer "page"
    t.index ["lesson_id"], name: "index_questions_on_lesson_id"
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
    t.integer "user_id"
    t.index ["course_id"], name: "index_registrations_on_course_id"
    t.index ["user_id"], name: "index_registrations_on_user_id"
  end

  create_table "scream_abouts", force: :cascade do |t|
    t.integer "rided_score", default: 0
    t.integer "scream_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_scream_abouts_on_question_id"
    t.index ["scream_id"], name: "index_scream_abouts_on_scream_id"
  end

  create_table "screams", force: :cascade do |t|
    t.integer "score", default: 0
    t.integer "user_id"
    t.integer "bar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_screams_on_bar_id"
    t.index ["user_id"], name: "index_screams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "usertag", limit: 1
    t.string "email", limit: 256
    t.string "nickname"
  end

end
