class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # allow the "avatar" field to be accepted when creating a new User:
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
  end


  def after_sign_in_path_for(resource)
    # "user_path" is the route "shorcut" for the show route
    user_path(resource.id)
  end
end
