# frozen_string_literal: true

# Migration to get rid of functionality that wasn't used
class RemovePublicFromNotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :notes, :public, :boolean
  end
end
