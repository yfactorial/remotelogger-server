# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090406144357) do

  create_table "accounts", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", :force => true do |t|
    t.integer  "account_id"
    t.string   "name",       :null => false
    t.string   "token",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applications", ["account_id"], :name => "index_applications_on_account_id"
  add_index "applications", ["token"], :name => "index_applications_on_token"

  create_table "device_labels", :force => true do |t|
    t.integer "account_id", :null => false
    t.string  "label",      :null => false
    t.string  "device_id",  :null => false
  end

  add_index "device_labels", ["account_id", "device_id"], :name => "index_device_labels_on_account_id_and_device_id", :unique => true
  add_index "device_labels", ["account_id", "label"], :name => "index_device_labels_on_account_id_and_label", :unique => true

  create_table "statements", :force => true do |t|
    t.integer  "application_id", :null => false
    t.string   "device_id",      :null => false
    t.string   "level",          :null => false
    t.text     "message",        :null => false
    t.datetime "logged_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statements", ["application_id"], :name => "index_statements_on_application_id"
  add_index "statements", ["level"], :name => "index_statements_on_level"
  add_index "statements", ["logged_at", "created_at"], :name => "index_statements_on_logged_at_and_created_at"

  create_table "users", :force => true do |t|
    t.integer "account_id",       :null => false
    t.string  "email",            :null => false
    t.string  "salt",             :null => false
    t.string  "crypted_password", :null => false
    t.string  "token",            :null => false
    t.string  "time_zone"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
