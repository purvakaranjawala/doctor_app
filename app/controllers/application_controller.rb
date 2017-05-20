class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :user_layout
  
  def after_sign_in_path_for(resource)
    if current_user.role == "doctor"
    	doctors_path
    else
      patients_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end
  
  def user_layout
    if user_signed_in?
      "application"
    else
      "login_page"
    end
  end
end
