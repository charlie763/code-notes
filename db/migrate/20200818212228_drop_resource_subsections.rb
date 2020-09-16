# frozen_string_literal: true

# Migration to get rid of functionality that wasn't used
class DropResourceSubsections < ActiveRecord::Migration[6.0]
  def change
    drop_table :resource_subsections
  end
end
