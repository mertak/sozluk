class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate!
    if current_admin 
      :authenticate_admin!
    elsif current_writer
      :authenticate_writer!
    else
      return false
    end
  end
end
