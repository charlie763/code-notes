class AddDisplayColorToLanguagesAndTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :display_color, :string
    add_column :topics, :display_color, :string
  end
end
