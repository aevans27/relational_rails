Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/players", to: "players#index"
  get "/teams/:id", to: "teams#show"
  get "/player_table_name", to: "players#index"
  get "/player_table_name/:id", to: "players#show"
  get "/teams/:id/player_table_name", to: "teams#players#index"
  
end
