module SignupHelper
  def user_login(login_params)
    visit '/login'
    fill_in("user[username]", with: login_params[:username])
    fill_in("user[password]", with: login_params[:password])
    click_button("Log In")
  end

  def user_signup(signup_params)
    visit '/users/new'
    fill_in("user[username]", with: signup_params[:username])
    fill_in("user[email]", with: signup_params[:email])
    fill_in("user[password]", with: signup_params[:password])
    click_button("Sign Up")
  end
end