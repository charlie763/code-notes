# frozen_string_literal: true

# Controller handles the sign up workflow
class UsersController < ApplicationController
  include SessionsHelper
  before_action :redirect_if_logged_in
  skip_before_action :redirect_if_logged_in, except: %i[new create]
  skip_before_action :redirect_if_not_logged_in, only: %i[new create]

  def new
    @user = User.new
    render layout: 'sessions'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user(@user.id)
      redirect_to root_path
    else
      render 'new', layout: 'sessions'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
