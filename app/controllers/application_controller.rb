class ApplicationController < ActionController::Base

  layout :layout

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username << :email << :first_name << :last_name
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  ##
  # Rendering 404
  #
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def layout
    devise_controller? ? 'devise' : 'application'
  end
end
