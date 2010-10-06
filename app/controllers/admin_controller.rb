class AdminController < ApplicationController

  def index
    exists = Admin.all.count > 0
    redirect_to root_url unless exists
  end

  def login
    exists = Admin.where(:username => params[:username], :password => params[:password]).count > 0
    if exists then
      redirect_to admin_index_url
    else
      redirect_to root_url, :notice => 'Login failed'
    end
  end

end
