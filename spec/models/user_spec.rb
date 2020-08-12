require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user_attributes) {{
      username: "RspecUser",
      password: "password",
      email: "test@test.com"
  }}

  it "creates a user when a user with valid attributes is saved" do
    valid_user = User.new(valid_user_attributes)
    valid_user.save
    expect(User.last.username).to eq(valid_user_attributes[:username])
  end

  it "doesn't create a user when the password is ill-formatted" do
    invalid_user_attributes = valid_user_attributes
    invalid_user_attributes[:email] = ".!Jonny@test@doubletest.com"
    invalid_user = User.create(invalid_user_attributes)
    expect(invalid_user).not_to be_valid
  end

  it "doesn't create a user if their username is not unique" do
    user1 = User.create(valid_user_attributes)
    user2 = User.create(username: valid_user_attributes[:username], password: "test", email: "test2@test.com")
    expect(user2).not_to be_valid
  end
end
