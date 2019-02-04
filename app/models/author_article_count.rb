class AuthorArticleCount < ApplicationRecord
	validates :author_name, presence: true
	
end
