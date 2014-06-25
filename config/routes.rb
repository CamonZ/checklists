Rails.application.routes.draw do

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
