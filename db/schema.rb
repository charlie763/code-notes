# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_825_152_456) do
  create_table 'code_snippets', force: :cascade do |t|
    t.text 'code'
    t.text 'annotation'
    t.integer 'note_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'external_resources', force: :cascade do |t|
    t.string 'name'
    t.string 'url'
    t.string 'description'
    t.integer 'external_resource_id'
    t.integer 'user_id'
    t.integer 'language_id'
  end

  create_table 'external_resources_notes', id: false, force: :cascade do |t|
    t.bigint 'external_resource_id', null: false
    t.bigint 'note_id', null: false
  end

  create_table 'languages', force: :cascade do |t|
    t.string 'name'
    t.string 'display_color'
  end

  create_table 'notes', force: :cascade do |t|
    t.string 'title'
    t.text 'summary'
    t.integer 'user_id'
    t.integer 'language_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'notes_topics', id: false, force: :cascade do |t|
    t.bigint 'topic_id', null: false
    t.bigint 'note_id', null: false
    t.index %w[note_id topic_id], name: 'index_notes_topics_on_note_id_and_topic_id'
    t.index %w[topic_id note_id], name: 'index_notes_topics_on_topic_id_and_note_id'
  end

  create_table 'topics', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'display_color'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password_digest'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'github_email'
  end
end
