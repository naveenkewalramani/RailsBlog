class ArticlesController < ApplicationController
  skip_before_action :check_session, only: :index
  def display_message(message)
    flash[:message]=message
    @article = Article.new
    render 'new'
  end

  def new
    @article = Article.new
    display_message("")
  end

  def create
    @article = Article.new
    if @article.check_params(article_params) == false
      display_message("Empty parameters are not accepted")
    elsif @article.check_article(article_params) == false
      display_message("Article already Exist")
    else
      @article = Article.create_article(article_params,session[:username])
      if @article == nil
        display_message("Error Occured")
      else
        redirect_to @article
      end
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @article = Article.all
  end

  def my_articles
    @article = Article.where(author: session[:username]).order('id ASC')
  end
  
  private
  def article_params
    params.require(:article).permit(:title,:content,:author)
  end
end
