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
