class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_name(params[:name])
    @session =  user if user.password == params[:password]
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    @session = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
