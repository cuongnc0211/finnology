Rails.application.routes.draw do
  
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  resources :articles, only: %i[index]
  get 'articles/:slug', to: 'articles#show', as: :article

  namespace :admin do
    root "articles#index"

    resources :articles
  end
end
