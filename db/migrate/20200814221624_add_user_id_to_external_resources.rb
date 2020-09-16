# frozen_string_literal: true

# Migration to associated resources with a user
class AddUserIdToExternalResources < ActiveRecord::Migration[6.0]
  def change
    add_column :external_resources, :user_id, :integer
  end
end
