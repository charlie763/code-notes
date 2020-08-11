class AddExternalResourceIdToExternalResources < ActiveRecord::Migration[6.0]
  def change
    add_column :external_resources, :external_resource_id, :integer
  end
end
