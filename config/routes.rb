Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecast#index"
      resources :gifs, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:new, :create, :destroy]
      resources :favorites, only: [:create, :index]
      delete '/favorites', to: "favorites#destroy"
    end
  end

end
