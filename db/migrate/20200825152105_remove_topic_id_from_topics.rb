# frozen_string_literal: true

# Migration to get rid of functionality that wasn't used
class RemoveTopicIdFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :topic_id, :integer
  end
end
