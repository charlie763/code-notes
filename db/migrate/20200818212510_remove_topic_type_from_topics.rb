# frozen_string_literal: true

# Migration to get rid of functionality that wasn't used
class RemoveTopicTypeFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :topic_type, :string
  end
end
