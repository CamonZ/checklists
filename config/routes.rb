Rails.application.routes.draw do

  resources :checklists

  get "/dashboard" => "dashboard#show", as: "dashboard"
  devise_for :users
  
  authenticated :user do
    root to: "dashboard#show", as: :authenticated_root
  end

  unauthenticated do
    root to: 'home#show', as: :unauthenticated_root
  end

end
