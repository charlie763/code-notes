class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def display_error(resource, attribute, optional_name=nil)
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
