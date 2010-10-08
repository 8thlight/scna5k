class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def logged_in
    Admin.where(:username => session[:username], :password => session[:password]).count > 0
  end

end
