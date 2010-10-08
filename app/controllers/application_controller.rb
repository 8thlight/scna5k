class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def all_runners
    Runner.find(:all, :order => 'time asc')
  end

  def logged_in
    Admin.where(:username => session[:username], :password => session[:password]).count > 0
  end

end
