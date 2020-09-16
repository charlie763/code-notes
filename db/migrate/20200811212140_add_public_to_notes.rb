# frozen_string_literal: true

# Migration that was later reverted because intended functionality not used.
class AddPublicToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :public, :boolean, default: true
  end
end
