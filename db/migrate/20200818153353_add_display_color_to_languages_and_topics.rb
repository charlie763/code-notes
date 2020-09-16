# frozen_string_literal: true

# Migration to give topics a display color. This is mostly a Rails workaround for something that would
# normally be done using Javascript (this project was intended to be Rails only).
class AddDisplayColorToLanguagesAndTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :display_color, :string
    add_column :topics, :display_color, :string
  end
end
