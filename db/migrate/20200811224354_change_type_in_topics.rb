# frozen_string_literal: true

# Migration because "type" is a reserved word and not usable as a column name
class ChangeTypeInTopics < ActiveRecord::Migration[6.0]
  def change
    rename_column :topics, :type, :topic_type
  end
end
