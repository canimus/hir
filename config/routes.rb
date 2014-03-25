Hir::Application.routes.draw do
  
  get "/login", to: "sessions#new", as: "login"
  get "/dashboard", to: "dashboard#index", as: "dashboard"
  get "/register", to: "identities#new"
  post "/auth/:provider/callback", to: "identities#create"

end
