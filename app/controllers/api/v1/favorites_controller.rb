class Api::V1::FavoritesController < ApplicationController

  def create
    if params[:api_key]
      user = User.find_by(api_key: params[:api_key])
      favorite_location = user.favorites.create(location: params[:location])
      render json: FavoritesSerializer.new(favorite_location)
    else
      render json: "Error: Please authorize your request with your API Key."
    end
  end

end
