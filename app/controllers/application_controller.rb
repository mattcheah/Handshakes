class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json
  
  def index
    render 'layouts/index'
  end
  
  def how_it_works
    render 'layouts/how_it_works'
  end
  
end
