Rails.application.routes.draw do
  require 'sidekiq/web' 
  mount Sidekiq::Web, :at => '/sidekiq'
  resources :articles
  root 'articles#index'
  get 'my_articles' => 'articles#my_articles'
  get 'users/new' => 'users#new'
  get 'users/signin' => 'users#signin'
  get 'users/signup' => 'users#signup' 
  get 'users/logout' => 'users#logout'
  get 'authors' => 'author_article_count#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
