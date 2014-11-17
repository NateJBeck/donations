Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :charities, only: [:show] do
    resources :towns, only: [:new, :create]
    resources :availabilities, only: [:create]
  end

  root "users#show"
end
