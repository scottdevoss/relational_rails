Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/teams", to: "teams#index"
  get "/teams/:id", to: "teams#show"
end
