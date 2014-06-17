Rails.application.routes.draw do

  resources :checklists

  get "/dashboard" => "dashboard#show", as: "dashboard"
  devise_for :users
  
  root to: 'home#show', as: :unauthenticated_root

end
