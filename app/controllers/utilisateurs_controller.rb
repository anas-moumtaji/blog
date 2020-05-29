class UtilisateursController < ApplicationController

  before_action :authenticate, :only =>[:index, :edit,:update ,:destroy]
  before_action :bon_utilisateur, :only =>[:edit,:update]
  before_action :utilisateur_admin, :only => [:detroy]


  def new
    @utilisateur = Utilisateur.new
  end

  def index
    @utilisateurs = Utilisateur.all.paginate(:page => params[:page], :per_page => 2)
  end


  def show
    @utilisateur = Utilisateur.find(params[:id])
    @articles = @utilisateur.articles.paginate(:page => params[:page])
  end

  def create
    @utilisateur = Utilisateur.new(utilisateur_parms)
    if @utilisateur.save
      flash[:success] = "Bienvenue !"
      redirect_to @utilisateur
    else
      render :new
    end
  end

  def edit
    @utilisateur = Utilisateur.find(params[:id])
  end

  def update
    @utilisateur = Utilisateur.find(params[:id])
    if @utilisateur.update_attributes(utilisateur_parms)
      flash[:success] = "Profil Actualise !"
      redirect_to @utilisateur
    else
      render :edit
    end
  end


  def destroy
    @utilisateur = Utilisateur.find(params[:id]).destroy
      flash[:success] = "Profil Supprimee !"
      redirect_to root_url
  end

private
  def utilisateur_parms
    params.require(:utilisateur).permit(:nom,:email,:password)
  end




  def bon_utilisateur
    @utilisateur = Utilisateur.find(params[:id])
    redirect_to(root_url) unless @utilisateur == @utilisateur_courant
  end


  def utilisateur_admin
    @utilisateur = Utilisateur.find(params[:id])
    if not @utilisateur_courant.admin? || @utilisateur == @utilisateur_courant
      redirect_to root_url
    end
  end



end
