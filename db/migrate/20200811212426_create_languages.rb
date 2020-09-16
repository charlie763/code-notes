# frozen_string_literal: true

# Migration for model representing programming languages
class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
    end
  end
end
