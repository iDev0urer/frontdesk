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

ActiveRecord::Schema.define(version: 20151116221233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "events", id: :uuid, default: "uuid_generate_v1()", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "groupable_type"
    t.integer  "groupable_id"
    t.string   "name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "organizations", id: :uuid, default: "uuid_generate_v1()", force: :cascade do |t|
    t.string   "name"
    t.json     "domains"
    t.text     "details"
    t.text     "notes"
    t.uuid     "tenant_id",  default: "uuid_generate_v1()"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "organizations", ["tenant_id"], name: "index_organizations_on_tenant_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "price"
    t.json     "features"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tenants", id: :uuid, default: "uuid_generate_v1()", force: :cascade do |t|
    t.string   "name"
    t.string   "subdomain",  null: false
    t.integer  "plan_id"
    t.json     "settings"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tenants", ["plan_id"], name: "index_tenants_on_plan_id", using: :btree

  create_table "ticket_events", force: :cascade do |t|
    t.uuid     "ticket_id"
    t.uuid     "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ticket_events", ["event_id"], name: "index_ticket_events_on_event_id", using: :btree
  add_index "ticket_events", ["ticket_id"], name: "index_ticket_events_on_ticket_id", using: :btree

  create_table "ticket_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", id: :uuid, default: "uuid_generate_v1()", force: :cascade do |t|
    t.string   "title"
    t.json     "ccs"
    t.integer  "ticket_type_id"
    t.integer  "priority"
    t.string   "status"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.uuid     "assignee_id"
    t.uuid     "requester_id"
  end

  add_index "tickets", ["ticket_type_id"], name: "index_tickets_on_ticket_type_id", using: :btree

  create_table "user_tickets", force: :cascade do |t|
    t.uuid     "user_id"
    t.uuid     "ticket_id"
    t.string   "user_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_tickets", ["ticket_id"], name: "index_user_tickets_on_ticket_id", using: :btree
  add_index "user_tickets", ["user_id"], name: "index_user_tickets_on_user_id", using: :btree

  create_table "users", id: :uuid, default: "uuid_generate_v1()", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.uuid     "organization_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["organization_id"], name: "index_users_on_organization_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "tenants", "plans"
  add_foreign_key "tickets", "ticket_types"
end
