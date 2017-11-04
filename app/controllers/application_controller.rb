class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json
  before_filter :configure_permitted_parameters, if: :devise_controller?

  
  def index
    render 'layouts/index'
  end
  
  def how_it_works
    render 'layouts/how_it_works'
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last])
  end
  
end
