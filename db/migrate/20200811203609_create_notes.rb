# frozen_string_literal: true

# Migration for model representing notes, the main model users interact with and that other models
# associate through
class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :summary
      t.integer :user_id
      t.integer :language_id

      t.timestamps
    end
  end
end
