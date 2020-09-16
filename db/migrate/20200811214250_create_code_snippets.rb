# frozen_string_literal: true

# Migration for model that represents a snippet of code attached to a note.
class CreateCodeSnippets < ActiveRecord::Migration[6.0]
  def change
    create_table :code_snippets do |t|
      t.text :code
      t.text :annotation
      t.integer :note_id

      t.timestamps
    end
  end
end
