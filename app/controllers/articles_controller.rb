class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def edit
  end

  def update
    if @article.update(article_params_whitelist)
      flash[:notice] = "Article was edited successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    if @article.destroy
      flash[:notice] = "Article was edited successfully"
    end
    redirect_to articles_path
  end

  def create
    @article = Article.new(article_params_whitelist)
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else
      render 'new'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params_whitelist
    params.require(:article).permit(:title, :description)
  end
end