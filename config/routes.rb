Rails.application.routes.draw do
  root 'home#index'
  mount Blazer::Engine, at: "blazer"

  resources :links
  get '/all' => 'home#all'
  get ':slug' => 'links#show'

  namespace :api do
    namespace :v1 do
      get "/linkstats", to: "links#get_link_stats"
      get "/stats", to: "links#get_stats"
    end
  end


end
