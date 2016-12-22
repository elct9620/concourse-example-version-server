Rails.application.routes.draw do
  resources :monsters
  resources :versions

  root to: "versions#index"

  mount Game::API => '/'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
