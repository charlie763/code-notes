# frozen_string_literal: true

# Migration adding github email attribute to user model so that github oauth is possible and separate
# from a database perspective than auth through a user given email.
class AddGithubEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github_email, :string
  end
end
