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

ActiveRecord::Schema.define(version: 20170427215008) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title_article"
    t.text     "text_article"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "photo_article_file_name"
    t.string   "photo_article_content_type"
    t.integer  "photo_article_file_size"
    t.datetime "photo_article_updated_at"
  end

  create_table "articles_books", id: false, force: :cascade do |t|
    t.integer "book_id",    null: false
    t.integer "article_id", null: false
    t.index ["article_id", "book_id"], name: "index_articles_books_on_article_id_and_book_id", using: :btree
    t.index ["book_id", "article_id"], name: "index_articles_books_on_book_id_and_article_id", using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "lName"
    t.string   "fName"
    t.text     "biography"
    t.string   "birthplace"
    t.date     "dateOfBirth"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "photo_author_file_name"
    t.string   "photo_author_content_type"
    t.integer  "photo_author_file_size"
    t.datetime "photo_author_updated_at"
  end

  create_table "authors_categories", id: false, force: :cascade do |t|
    t.integer "author_id",   null: false
    t.integer "category_id", null: false
    t.index ["author_id", "category_id"], name: "index_authors_categories_on_author_id_and_category_id", using: :btree
    t.index ["category_id", "author_id"], name: "index_authors_categories_on_category_id_and_author_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "yearPublication"
    t.integer  "author_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "photo_book_file_name"
    t.string   "photo_book_content_type"
    t.integer  "photo_book_file_size"
    t.datetime "photo_book_updated_at"
    t.integer  "paperback"
    t.string   "editionLanguage"
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "book_id",     null: false
    t.index ["book_id", "category_id"], name: "index_books_categories_on_book_id_and_category_id", using: :btree
    t.index ["category_id", "book_id"], name: "index_books_categories_on_category_id_and_book_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_users", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "user_id",     null: false
    t.index ["category_id", "user_id"], name: "index_categories_users_on_category_id_and_user_id", using: :btree
    t.index ["user_id", "category_id"], name: "index_categories_users_on_user_id_and_category_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text_comment"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["post_id"], name: "index_comments_on_post_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "favorite_books", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "user_id"], name: "index_favorite_books_on_book_id_and_user_id", using: :btree
    t.index ["user_id", "book_id"], name: "index_favorite_books_on_user_id_and_book_id", using: :btree
  end

  create_table "friends", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_friends_on_followed_id", using: :btree
    t.index ["follower_id", "followed_id"], name: "index_friends_on_follower_id_and_followed_id", unique: true, using: :btree
    t.index ["follower_id"], name: "index_friends_on_follower_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_posts_on_user_id_and_created_at", using: :btree
    t.index ["user_id"], name: "index_posts_on_user_id", using: :btree
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "user_id"
    t.boolean  "read",             default: false
    t.boolean  "toRead",           default: false
    t.boolean  "favorite",         default: false
    t.boolean  "currentlyReading", default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["book_id", "user_id"], name: "index_statuses_on_book_id_and_user_id", using: :btree
    t.index ["user_id", "book_id"], name: "index_statuses_on_user_id_and_book_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_taggings_on_article_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                   default: false
    t.string   "photo_user_file_name"
    t.string   "photo_user_content_type"
    t.integer  "photo_user_file_size"
    t.datetime "photo_user_updated_at"
    t.string   "surname"
    t.date     "dateOfBirth"
    t.string   "gender"
    t.string   "city"
    t.string   "country"
    t.text     "aboutMe"
    t.text     "interests"
    t.string   "activation_digest"
    t.boolean  "activated",               default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "posts", "users"
  add_foreign_key "taggings", "articles"
  add_foreign_key "taggings", "tags"
end
