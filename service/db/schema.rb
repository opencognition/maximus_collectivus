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

ActiveRecord::Schema.define(:version => 20130608144112) do

  create_table "authorizations", :force => true do |t|
    t.integer  "node_id",    :null => false
    t.integer  "role_id",    :null => false
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authorizations", ["group_id"], :name => "I_AUTHORIZATIONS_GROUP_ID"
  add_index "authorizations", ["node_id"], :name => "I_AUTHORIZATIONS_NODE_ID"
  add_index "authorizations", ["role_id"], :name => "I_AUTHORIZATIONS_ROLE_ID"
  add_index "authorizations", ["user_id"], :name => "I_AUTHORIZATIONS_USER_ID"

  create_table "categories", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "category_tags", :force => true do |t|
    t.integer  "category_id", :null => false
    t.integer  "tag_id",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exercises", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "expanded_authorizations", :id => false, :force => true do |t|
    t.integer "id",      :default => 0, :null => false
    t.integer "node_id", :default => 0, :null => false
    t.integer "lft"
    t.integer "rgt"
    t.integer "role_id", :default => 0, :null => false
    t.integer "user_id"
  end

  create_table "groups", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.string   "code"
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "nodes", :force => true do |t|
    t.integer  "describer_id"
    t.string   "describer_type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "position"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "nodes", ["describer_id"], :name => "I_NODES_DESCRIBER_ID"
  add_index "nodes", ["describer_type"], :name => "I_NODES_DESCRIBER_TYPE"
  add_index "nodes", ["lft"], :name => "I_NODES_LFT"
  add_index "nodes", ["parent_id"], :name => "I_NODES_PARENT_ID"
  add_index "nodes", ["rgt"], :name => "I_NODES_RGT"

  create_table "permissions", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "role_permissions", :force => true do |t|
    t.integer  "role_id",       :null => false
    t.integer  "permission_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "code"
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sections", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tags", :force => true do |t|
    t.string   "code"
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "user_groups", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "group_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_groups", ["group_id"], :name => "I_USER_GROUPS_GROUP_ID"
  add_index "user_groups", ["user_id"], :name => "I_USER_GROUPS_USER_ID"

  create_table "user_nodes", :id => false, :force => true do |t|
    t.integer  "user_id"
    t.integer  "id",             :default => 0, :null => false
    t.integer  "describer_id"
    t.string   "describer_type"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.integer  "position"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "uuid",        :null => false
    t.string   "password",    :null => false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "users", ["email"], :name => "I_USERS_EMAIL"

  create_table "workflow_statuses", :force => true do |t|
    t.string   "code",        :null => false
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "workflows", :force => true do |t|
    t.integer  "node_id",                           :null => false
    t.integer  "workflow_status_id",                :null => false
    t.integer  "active",             :default => 1, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

end
