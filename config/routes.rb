Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/all_urls', to: 'url#show'
  get 'short_to_original(/:short_url)', to: 'url#short_to_original'
  post '/original_to_short/', to: 'url#original_to_short'
end
