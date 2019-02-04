class AuthorArticleCountController < ApplicationController
	
	def index
		@author_article_count = AuthorArticleCount.all.order('id ASC')
		render 'index'
	end
end
