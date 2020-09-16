# frozen_string_literal: true

# Migration intended to allow assocatiation of external resources with external resources. Later
# removed because functionality not used.
class AddExternalResourceIdToExternalResources < ActiveRecord::Migration[6.0]
  def change
    add_column :external_resources, :external_resource_id, :integer
  end
end
