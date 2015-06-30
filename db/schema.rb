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

ActiveRecord::Schema.define(version: 20150629234500) do

  create_table "requests", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "other_phone"
    t.boolean  "laptop_issue"
    t.text     "laptop_desc"
    t.boolean  "software_issue"
    t.text     "software_desc"
    t.boolean  "blackberry_issue"
    t.text     "blackberry_desc"
    t.boolean  "email_issue"
    t.text     "email_desc"
    t.boolean  "pst_issue"
    t.text     "pst_desc"
    t.boolean  "shared_folder_issue"
    t.text     "shared_folder_desc"
    t.boolean  "other_hardware_issue"
    t.text     "other_hardware_desc"
    t.boolean  "air_card_issue"
    t.text     "air_card_desc"
    t.text     "other_issue"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.text     "other_desc"
    t.integer  "assigned_to_role"
    t.integer  "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.integer  "role"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "phone"
    t.string   "other_phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
