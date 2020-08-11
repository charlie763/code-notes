class AddPublicToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :public, :boolean, default: true
  end
end
