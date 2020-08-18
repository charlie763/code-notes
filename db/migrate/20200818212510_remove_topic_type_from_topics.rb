class RemoveTopicTypeFromTopics < ActiveRecord::Migration[6.0]
  def change
    remove_column :topics, :topic_type, :string
  end
end
