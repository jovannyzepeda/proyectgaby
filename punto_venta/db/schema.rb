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

ActiveRecord::Schema.define(version: 20151017142234) do

  create_table "articulos", force: :cascade do |t|
    t.string   "nombre",        limit: 255
    t.text     "descripcion",   limit: 65535
    t.integer  "existencia",    limit: 4
    t.float    "precio_compra", limit: 24
    t.float    "precio_venta",  limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nombre",     limit: 255
    t.string   "telefono",   limit: 255
    t.string   "domicilio",  limit: 255
    t.string   "correo",     limit: 255
    t.string   "categoria",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "details", force: :cascade do |t|
    t.integer  "sell_id",     limit: 4
    t.integer  "articulo_id", limit: 4
    t.integer  "catidad",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "details", ["articulo_id"], name: "index_details_on_articulo_id", using: :btree
  add_index "details", ["sell_id"], name: "index_details_on_sell_id", using: :btree

  create_table "detalle", force: :cascade do |t|
    t.integer  "venta_id",    limit: 4
    t.integer  "articulo_id", limit: 4
    t.integer  "cantidad",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "detalle", ["articulo_id"], name: "index_detalle_on_articulo_id", using: :btree
  add_index "detalle", ["venta_id"], name: "index_detalle_on_venta_id", using: :btree

  create_table "sells", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "cliente_id", limit: 4
    t.float    "total",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sells", ["cliente_id"], name: "index_sells_on_cliente_id", using: :btree
  add_index "sells", ["user_id"], name: "index_sells_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venta", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "cliente_id", limit: 4
    t.date     "fecha"
    t.float    "total",      limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "venta", ["cliente_id"], name: "index_venta_on_cliente_id", using: :btree
  add_index "venta", ["user_id"], name: "index_venta_on_user_id", using: :btree

  add_foreign_key "details", "articulos"
  add_foreign_key "details", "sells"
  add_foreign_key "sells", "clientes"
  add_foreign_key "sells", "users"
  add_foreign_key "venta", "clientes"
  add_foreign_key "venta", "users"
end
