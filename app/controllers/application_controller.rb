class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  # helper_method :current_user
  # def current_user
  #   User.first
  # end
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue from CanCan::AccessDenied do ||exception
    redirect_to root_path, alert: exception.message 
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,        keys: [ :name ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
  end
end
