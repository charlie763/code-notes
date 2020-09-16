# frozen_string_literal: true

# Main controller class. Used to define helper methods that are used across controllers and
# in some views.
class ApplicationController < ActionController::Base
  before_action :redirect_if_not_logged_in

  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def redirect_if_not_logged_in
    redirect_to '/login' unless logged_in?
  end

  def display_error(resource, attribute, optional_name = nil)
    subject = (optional_name || attribute).to_s.capitalize
    if resource.errors.messages[attribute].present?
      "#{subject} #{resource.errors.messages[attribute].join(', ')}:"
    else
      "#{subject}:"
    end
  end

  helper_method :current_user
  helper_method :logged_in?
  helper_method :display_error
end
