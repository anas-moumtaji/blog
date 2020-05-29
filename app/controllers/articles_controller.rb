class ArticlesController < ApplicationController

  before_action :authenticate, :only =>[:create ,:destroy]


    def create
      @article = utilisateur_courant.articles.build(article_params)
      if @article.save
        flash[:success] = "Article crée !"
        redirect_to root_url
      else
        render rool_url
      end
    end


    def destroy

    end

    def article_params
      params.require(:article).permit(:title, :description)
    end

end
