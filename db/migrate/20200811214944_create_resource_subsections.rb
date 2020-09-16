# frozen_string_literal: true

# Migration that was later removed because intended functionality not used.
class CreateResourceSubsections < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_subsections do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :locator
    end
  end
end
