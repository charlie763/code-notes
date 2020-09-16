# frozen_string_literal: true

# Migration making it possible to associate resources with notes.
class CreateResourcesNotesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :external_resources, :notes do |t|
    end
  end
end
