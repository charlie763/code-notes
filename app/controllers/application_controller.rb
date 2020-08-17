class ApplicationController < ActionController::Base
  def current_user
    User.find_by(id: session[:user_id])
  end

  def display_error(resource, attribute)
    if resource.errors.messages[attribute].present?
      "#{attribute.to_s.capitalize} #{resource.errors.messages[attribute].join(', ')}:"
    else
      "#{attribute.to_s.capitalize}:"
    end
  end

  helper_method :current_user
  helper_method :display_error
end
