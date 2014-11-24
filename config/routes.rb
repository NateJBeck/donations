Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  namespace :admin do
    resources :charities, only: [:show] do
      resources :availabilities, only: [:new, :create, :index, :show]
      resources :pickups, only: [:index]
      resources :presences, only: [:new, :create]
    end

    root to: "/admin/charities#show"
  end

  resources :charities, only: [:show] do
    resources :availabilities, only: [:create, :index, :show]
    resources :pickups, only: [:index]
    resources :presences, only: [:new, :create]
  end

  resources :availabilities, only: [:index, :show] do
    resources :pickups, only: [:create, :new, :show]
  end

  resources :pickups, only: [] do
    resources :pickup_confirmations, only: [:create]
  end

  root to: "availabilities#index"
end
