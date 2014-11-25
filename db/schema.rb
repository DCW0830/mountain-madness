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

ActiveRecord::Schema.define(version: 20141125175409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "business_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "trails", force: true do |t|
    t.decimal  "distance"
    t.text     "description"
    t.integer  "rating"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unique_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "experience"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "uid"
    t.string   "provider"
    t.string   "oauth_token"
    t.string   "oauth_secret"
    t.string   "image"
  end

  create_table "usertrails", force: true do |t|
    t.integer  "user_id"
    t.integer  "trail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
