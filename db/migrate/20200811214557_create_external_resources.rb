class CreateExternalResources < ActiveRecord::Migration[6.0]
  def change
    create_table :external_resources do |t|
      t.string :name
      t.string :url
      t.string :description
    end
  end
end
