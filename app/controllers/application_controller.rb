class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    redirect_to 'login' if @session.nil?
  end
  helper_method :current_user
end