# frozen_string_literal: true

# Migration for model representing a resource (i.e. link, article etc.) that can be associated
# with either a note or a language.
class CreateExternalResources < ActiveRecord::Migration[6.0]
  def change
    create_table :external_resources do |t|
      t.string :name
      t.string :url
      t.string :description
    end
  end
end
