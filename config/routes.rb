Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :charities, only: [:show] do
    resources :availabilities, only: [:create]
    resources :presences, only: [:new, :create]
  end

  resources :availabilities, only: [:index]

  root "users#show"
end
