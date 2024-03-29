Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/teams", to: "teams#index"
  get "/teams/new", to: "teams#new"
  get "/teams/:id", to: "teams#show"
  get "/players", to: "players#index"
  get "/players/:id", to: "players#show"
  get "/teams/:team_id/players", to: "team_players#index"
  post "/teams", to: "teams#create"
  get "/teams/:id/edit", to: "teams#edit"
  patch "/teams/:id", to: "teams#update"
  get "/teams/:id/players/new", to: "team_players#new"
  post "/teams/:id/players/", to: "team_players#create"
  get "/players/:id/edit", to: "players#edit"
  patch "/players/:id", to: "players#update"
  delete "/teams/:id", to: "teams#destroy"
  delete "/players/:id", to: "players#destroy"
end
