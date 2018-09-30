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

ActiveRecord::Schema.define(version: 20180930062613) do

  create_table "groups", force: :cascade do |t|
    t.integer "codigo"
    t.integer "subject_id"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_groups_on_student_id"
    t.index ["subject_id"], name: "index_groups_on_subject_id"
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "groups_schedules", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "schedule_id"
    t.integer "subject_id"
    t.index ["group_id"], name: "index_groups_schedules_on_group_id"
    t.index ["schedule_id"], name: "index_groups_schedules_on_schedule_id"
    t.index ["subject_id"], name: "index_groups_schedules_on_subject_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "group_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_notes_on_group_id"
    t.index ["student_id"], name: "index_notes_on_student_id"
    t.index ["subject_id"], name: "index_notes_on_subject_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "nombre"
    t.integer "school_id"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_programs_on_school_id"
    t.index ["teacher_id"], name: "index_programs_on_teacher_id"
  end

  create_table "programs_semesters", id: false, force: :cascade do |t|
    t.integer "semester_id"
    t.integer "program_id"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.index ["program_id"], name: "index_programs_semesters_on_program_id"
    t.index ["semester_id"], name: "index_programs_semesters_on_semester_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "dia"
    t.string "hora_inicio"
    t.string "hora_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "nombre"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_schools_on_teacher_id"
  end

  create_table "semesters", force: :cascade do |t|
    t.integer "semestre"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "semesters_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "semester_id"
    t.date "fecha_inicio"
    t.date "fecha_fin"
    t.decimal "promedio"
    t.index ["semester_id"], name: "index_semesters_students_on_semester_id"
    t.index ["student_id"], name: "index_semesters_students_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "codigo", null: false
    t.integer "documento", null: false
    t.string "nombres", null: false
    t.string "apellidos", null: false
    t.integer "es_egresado", null: false
    t.decimal "promedio_carrera", default: "0.0"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento"], name: "index_students_on_documento", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "codigo"
    t.string "nombre"
    t.integer "creditos"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_subjects_on_semester_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "documento", null: false
    t.string "nombres", null: false
    t.string "apellidos", null: false
    t.string "especialidad", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["documento"], name: "index_teachers_on_documento", unique: true
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
