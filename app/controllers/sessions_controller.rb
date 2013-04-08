class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_name(params[:name])
    session[:user_id] =  user.id if user.password == params[:password]
    logger.info("Login level response: #{session.inspect}")
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end