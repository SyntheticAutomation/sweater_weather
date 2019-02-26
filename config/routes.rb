Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: "forecast#index"
      resources :gifs, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:new, :create, :destroy]
    end
  end

end
