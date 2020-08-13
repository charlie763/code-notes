require 'rails_helper'

RSpec.describe 'Sign Up', type: :feature do
  it 'signs up a valid user' do
    user_signup(
      username: "Charlie_rspec",
      email: "test@test.com",
      password: "test"
    )
    expect(User.last.username).to eq("Charlie_rspec")
  end

  it 'logs in the user if the user is valid' do
    user_signup(
      username: "Charlie_rspec",
      email: "test@test.com",
      password: "test"
    )
    expect(page.get_rack_session_key('user_id')).to_not be_nil
  end

  it 'renders the signup page again if user is invalid' do
    user_signup(
      username: nil,
      email: "test@test.com",
      password: "test"
    )
    expect(page).to have_content('Sign Up')
  end

end