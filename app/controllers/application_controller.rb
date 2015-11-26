class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    origin_path = session[:origin_path]
    clear_origin_path
    if origin_path.present?
      origin_path
    else
      params[:target].presence || articles_path
    end
  end

  private

  def authenticate_user!(opts={}) 
    opts[:scope] = :user
    store_origin_path
    super
  end

  def store_origin_path
    session[:origin_path] = request.fullpath
  end

  def clear_origin_path
    session[:origin_path] = nil
  end
end
