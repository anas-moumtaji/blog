class ApplicationController < ActionController::Base
  include SessionsHelper

  def authenticate
    unless logged_in?
      flash[:danger] = "Merci de se connecter"
      redirect_to login_url
    end
end

end
