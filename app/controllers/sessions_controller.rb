class SessionsController < ApplicationController
  include SessionsHelper
  layout "sessions"
  before_action :redirect_if_logged_in
  skip_before_action :redirect_if_logged_in, except: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      login_user(@user.id)
      redirect_to root_path
    else
      flash[:alert] = "Password and/or username are incorrect."
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end
end
