class AddLanguageIdToExternalResources < ActiveRecord::Migration[6.0]
  def change
    add_column :external_resources, :language_id, :integer
  end
end
