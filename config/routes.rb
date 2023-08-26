Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  post "/teams", to: "teams#create"
  get "/teams/:id", to: "teams#show"
  get "/teams/:id/player_table_name", to: "teams#players#index"
  get "/teams/:id/edit", to: "teams#edit"
  patch "/teams/:id", to: "teams#update"
  get "/teams/:team_id/player_table_name/new", to: "players#new"
  post "/teams/:team_id/player_table_name", to: "players#create"
  get "/players", to: "players#index"
  get "/player_table_name", to: "players#index"
  get "/player_table_name/:id", to: "players#show"
  get "/player_table_name/:id/edit", to: "players#edit"
  patch "/player_table_name/:id", to: "players#update"
  
end
