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

ActiveRecord::Schema.define(version: 20180929191332) do

  create_table "groups", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_groups_on_student_id"
    t.index ["subject_id"], name: "index_groups_on_subject_id"
    t.index ["teacher_id"], name: "index_groups_on_teacher_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "student_id"
    t.integer "subject_id"
    t.integer "group_id"
    t.decimal "nota"
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

  create_table "schedules", force: :cascade do |t|
    t.string "dia"
    t.string "hora"
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

  create_table "students", force: :cascade do |t|
    t.integer "documento"
    t.string "nombres"
    t.string "apellidos"
    t.integer "es_egresado"
    t.string "clave"
    t.decimal "promedio_carrera"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "nombre_materia"
    t.integer "creditos"
    t.integer "semester_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["semester_id"], name: "index_subjects_on_semester_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "nombres"
    t.string "apellidos"
    t.string "especialidad"
    t.string "usuario"
    t.string "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
