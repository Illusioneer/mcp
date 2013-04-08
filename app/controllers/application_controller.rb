class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    redirect_to '/login' if session[:user_id] == nil
    logger.info("App level response: #{session.inspect}")
    return session
  end

  helper_method :current_user

end