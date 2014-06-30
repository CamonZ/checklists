Rails.application.routes.draw do

  namespace :api, defaults: {format: 'json' } do
    namespace :v1 do
      get "dashboard", controller: "dashboard", action: :index
      post "users/sign_in", controller: "users"
      resources :checklists, only: [:index, :show]
    end
  end

  use_doorkeeper
  
  resources :checklists

  get "/dashboard" => "dashboard#show", as: "dashboard"
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#show', as: :unauthenticated_root
  end

end
