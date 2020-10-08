class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :community
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :password])
  end
end
