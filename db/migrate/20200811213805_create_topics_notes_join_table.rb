# frozen_string_literal: true

# Migration making it possible to associated notes with topics
class CreateTopicsNotesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :topics, :notes do |t|
      t.index %i[topic_id note_id]
      t.index %i[note_id topic_id]
    end
  end
end
