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
