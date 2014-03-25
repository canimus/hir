Hir::Application.routes.draw do
  
  resources :identities
  post "/auth/:provider/callback", to: "identities#create"

end
