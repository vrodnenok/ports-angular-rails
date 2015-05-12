class ApplicationController < ActionController::Base
  include ActionController::MimeResponds
  include DeviseTokenAuth::Concerns::SetUserByToken
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up)<<:first_name<<:last_name<<:password_confirmation<<:registration
  end

  def index
  end
end
