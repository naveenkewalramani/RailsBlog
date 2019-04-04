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
    @article.tags = Tag.where(id: @article.tags.to_i).first[:tag_name]
  end

  def index
    @article = Article.limit(15)
    @article.each do |x|
      x.tags = Tag.where(id: x.tags.to_i).first[:tag_name]
    end
  end

  def my_articles
    @article = Article.where(author: session[:username]).order('id ASC')
    @article.each do |x|
      x.tags = Tag.where(id: x.tags.to_i).first[:tag_name]
    end
  end

  def upvote
    @article = Article.find(params[:id])
    @article.update(:likes @article.likes+=1)
    return 
  end

  def downvote
    @article = Article.find(params[:id])
    @article.update(:dislikes @article.dislikes+=1)
    return 
  end

  private
  def article_params
    params.require(:article).permit(:title,:content,:author ,:tags)
  end
end
