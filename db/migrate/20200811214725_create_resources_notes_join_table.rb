class CreateResourcesNotesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :external_resources, :notes do |t|
    end
  end
end
