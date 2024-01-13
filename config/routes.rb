Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "articles#index"
  get '/search_results', to: 'articles#search_results', as: 'search_results'
  get '/search_trends', to: 'analytics#search_trends', as: 'search_trends'
  get '/articles/new', to: 'articles#new', as: 'new_article'
  
  resources :articles
end
