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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120806213525) do

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "emails", :force => true do |t|
    t.string   "from_address",     :null => false
    t.string   "reply_to_address"
    t.string   "subject"
    t.text     "to_address"
    t.text     "cc_address"
    t.text     "bcc_address"
    t.text     "content"
    t.datetime "sent_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "list_contents", :force => true do |t|
    t.integer  "list_id"
    t.integer  "word_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "points",     :default => 0
  end

  create_table "lists", :force => true do |t|
    t.integer  "user_id"
    t.string   "list_type"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "progresses", :force => true do |t|
    t.integer  "user_id"
    t.integer  "word_id"
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "mode"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.boolean  "admin"
  end

  create_table "whats_new_messages", :force => true do |t|
    t.string   "title"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "text"
    t.boolean  "user_specific"
    t.datetime "expiration_date"
  end

  create_table "words", :force => true do |t|
    t.string   "name"
    t.string   "meaning"
    t.string   "sentence"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
