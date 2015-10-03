class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    permits = [:email,
               :password,
               :password_confirmation,
               :current_password,
               :avatar,
               :name,
               :surname,
               :phone,
               :date_of_birth]
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( permits.push(:"g-recaptcha-response")) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(permits) }
  end

  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end
