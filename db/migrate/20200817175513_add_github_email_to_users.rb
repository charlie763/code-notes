class AddGithubEmailToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :github_email, :string
  end
end
