class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :type
      t.string :name
      t.integer :topic_id

      t.timestamps
    end
  end
end
