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

ActiveRecord::Schema.define(version: 20180807042222) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.text "right_answer"
    t.text "wrong_1"
    t.text "wrong_2"
    t.text "wrong_3"
    t.text "wrong_4"
    t.integer "excercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "asignacions", force: :cascade do |t|
    t.integer "test_id"
    t.integer "sala_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.text "descripcion"
    t.integer "eje_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colegios", force: :cascade do |t|
    t.text "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contenidos", force: :cascade do |t|
    t.text "nombre"
    t.integer "anterior"
    t.integer "siguiente"
    t.integer "categoria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tema_id"
  end

  create_table "ejercicios", force: :cascade do |t|
    t.integer "contenido_id"
    t.integer "dificultad"
    t.string "imagen"
    t.text "pregunta"
    t.integer "indicador_id"
    t.string "habilidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "opcion1"
    t.text "opcion2"
    t.text "opcion3"
    t.text "opcion4"
    t.text "opcion5"
  end

  create_table "ejes", force: :cascade do |t|
    t.integer "materia_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "indicators", force: :cascade do |t|
    t.integer "objetivo_id"
    t.text "descripcion"
    t.integer "numeral"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "intento_tests", force: :cascade do |t|
    t.integer "test_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pendiente"
  end

  create_table "nivels", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "objetivos", force: :cascade do |t|
    t.integer "eje_id"
    t.text "descripcion"
    t.integer "numeral"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profesors", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_profesors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_profesors_on_reset_password_token", unique: true
  end

  create_table "puntajes", force: :cascade do |t|
    t.integer "nivel_id"
    t.integer "categoria_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salas", force: :cascade do |t|
    t.integer "profesor_id"
    t.integer "colegio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "nombre"
  end

  create_table "seccions", force: :cascade do |t|
    t.integer "contenido_id"
    t.integer "test_id"
    t.integer "numero_ejercicios"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "nombre"
  end

  create_table "temas", force: :cascade do |t|
    t.text "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tests", force: :cascade do |t|
    t.integer "profesor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "nombre"
  end

  create_table "tributos", force: :cascade do |t|
    t.text "contenido_name"
    t.integer "contenido_id"
    t.text "indicador_name"
    t.integer "indicador_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "excercise_id"
    t.string "user_answer"
    t.boolean "correct"
    t.boolean "active"
    t.integer "intento_guia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.string "picture"
    t.integer "sala_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pinicial"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
