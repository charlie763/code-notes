class DropResourceSubsections < ActiveRecord::Migration[6.0]
  def change
    drop_table :resource_subsections
  end
end
