class SessionsController < ApplicationController
  def new
  end

  def create
    utilisateur = Utilisateur.find_by(email: params[:session][:email].downcase)
    if utilisateur && utilisateur.authenticate(params[:session][:password])
      log_in utilisateur
      redirect_to utilisateur
    else
      flash.now[:danger] = "Combinaison email/password invalide"
      render "new"
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
