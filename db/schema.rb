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

ActiveRecord::Schema.define(version: 20140914093547) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["post_id", "user_id"], name: "index_follows_on_post_id_and_user_id", unique: true, using: :btree
  add_index "follows", ["post_id"], name: "index_follows_on_post_id", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["post_id", "user_id"], name: "index_likes_on_post_id_and_user_id", unique: true, using: :btree
  add_index "likes", ["post_id"], name: "index_likes_on_post_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "notifications", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "post_id",                    null: false
    t.integer  "notif_user",                 null: false
    t.string   "action",                     null: false
    t.boolean  "seen",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["post_id"], name: "index_notifications_on_post_id", using: :btree
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id",                             null: false
    t.text     "title",                               null: false
    t.string   "file_link"
    t.boolean  "solved",              default: false, null: false
    t.text     "content",                             null: false
    t.integer  "notifications_count", default: 0,     null: false
    t.boolean  "anonymous",           default: false, null: false
    t.float    "avg_rate",            default: 0.0,   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ups"
    t.integer  "downs"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "tag_id",  null: false
    t.integer "post_id", null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id", unique: true, using: :btree
  add_index "posts_tags", ["tag_id"], name: "index_posts_tags_on_tag_id", using: :btree

  create_table "rates", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "post_id",                null: false
    t.integer  "level",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["post_id"], name: "index_rates_on_post_id", using: :btree
  add_index "rates", ["user_id", "post_id"], name: "index_rates_on_user_id_and_post_id", unique: true, using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",        limit: 45, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.integer   "user_id"
    t.string    "username",            limit: 15,              null: false
    t.string    "fullname",            limit: 80,              null: false
    t.integer   "room"
    t.string    "hostel",              limit: 40
    t.text      "profile_picture",                             null: false
    t.datetime  "time_of_reg"
    t.string    "current_mess",        limit: 40
    t.string    "comment",             limit: 50
    t.string    "remember_token",      limit: 128
    t.string    "bgroup",              limit: 5
    t.integer   "contact",             limit: 8,   default: 0
    t.string    "email"
    t.string    "nick"
    t.string    "gender",              limit: 1
    t.string    "picaddress",          limit: 50
    t.timestamp "updated_timestamp"
    t.text      "usertype"
    t.integer   "notifications_count",             default: 0, null: false
<<<<<<< HEAD
    t.string    "typename",            limit: 40
=======
    t.string    "avatar_file_name"
    t.string    "avatar_content_type"
    t.integer   "avatar_file_size"
    t.datetime  "avatar_updated_at"
>>>>>>> 18829aecc61b96501ce84dec8934b2b6157c40ba
  end

  add_index "users", ["username"], name: "UNIQUE", unique: true, using: :btree
  add_index "users", ["username"], name: "username", unique: true, using: :btree

end
