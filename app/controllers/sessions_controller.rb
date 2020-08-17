class SessionsController < ApplicationController
  include SessionsHelper
  layout "sessions"
  before_action :redirect_if_logged_in
  skip_before_action :redirect_if_logged_in, except: [:new, :create]

  def new
  end

  def create
    if auth_hash
      case auth_hash.provider
        when 'github'
          unless @user = User.find_by(github_email: auth_hash.info.email)
            username = User.username_if_not_taken(auth_hash.info.nickname)
            @user = User.create(
              username: username, 
              github_email: auth_hash.info.email,
              password: SecureRandom.hex 
            )
          end
      end
      login_user(@user.id)
      redirect_to root_path
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        login_user(@user.id)
        redirect_to root_path
      else
        flash[:alert] = "Password and/or username are incorrect."
        render 'new'
      end
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
