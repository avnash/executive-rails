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

ActiveRecord::Schema.define(version: 20140910141657) do

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

end
