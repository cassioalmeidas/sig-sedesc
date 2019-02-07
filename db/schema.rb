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

ActiveRecord::Schema.define(version: 2019_02_06_142626) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almoxarifado_entradas", force: :cascade do |t|
    t.bigint "almoxarifado_materiais_id"
    t.integer "quantidade", null: false
    t.bigint "numero_empenho"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["almoxarifado_materiais_id"], name: "index_almoxarifado_entradas_on_almoxarifado_materiais_id"
  end

  create_table "almoxarifado_materiais", force: :cascade do |t|
    t.string "descricao", null: false
    t.integer "quantidade", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "almoxarifado_retiradas", force: :cascade do |t|
    t.bigint "almoxarifado_materiais_id"
    t.integer "quantidade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "almoxarifado_setor_id"
    t.string "responsavel", default: "", null: false
    t.index ["almoxarifado_materiais_id"], name: "index_almoxarifado_retiradas_on_almoxarifado_materiais_id"
    t.index ["almoxarifado_setor_id"], name: "index_almoxarifado_retiradas_on_almoxarifado_setor_id"
  end

  create_table "almoxarifado_setores", force: :cascade do |t|
    t.string "descricao", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "audits", force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.integer "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.jsonb "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "papeis", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_papeis_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_papeis_on_resource_type_and_resource_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_usuarios_on_unlock_token", unique: true
    t.index ["username"], name: "index_usuarios_on_username", unique: true
  end

  create_table "usuarios_papeis", id: false, force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "papel_id"
    t.index ["papel_id"], name: "index_usuarios_papeis_on_papel_id"
    t.index ["usuario_id", "papel_id"], name: "index_usuarios_papeis_on_usuario_id_and_papel_id"
    t.index ["usuario_id"], name: "index_usuarios_papeis_on_usuario_id"
  end

  add_foreign_key "almoxarifado_entradas", "almoxarifado_materiais", column: "almoxarifado_materiais_id"
  add_foreign_key "almoxarifado_retiradas", "almoxarifado_materiais", column: "almoxarifado_materiais_id"
  add_foreign_key "almoxarifado_retiradas", "almoxarifado_setores"
end
