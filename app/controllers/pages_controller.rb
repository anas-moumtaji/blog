class PagesController < ApplicationController
  def home
    @titre = "Home"
    @article = utilisateur_courant.articles.build if logged_in?
  end

  def aide
    @titre = "Aide"
  end

  def contact
    @titre = "Contact"
  end
end
