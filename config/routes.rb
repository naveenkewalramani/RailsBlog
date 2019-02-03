Rails.application.routes.draw do
  resources :articles
  root 'articles#index'
  get 'my_article' => 'articles#my_article'
  get 'users/new' => 'users#new'
  get 'users/signin' => 'users#signin'
  get 'users/signup' => 'users#signup' 
  get 'users/logout' => 'users#logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
