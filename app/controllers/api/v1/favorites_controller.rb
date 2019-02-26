class Api::V1::FavoritesController < ApplicationController

  def create
    user = User.find_by(api_key: params[:api_key])
    if params[:api_key] && user
      favorite_location = user.favorites.create(location: params[:location])
      render json: FavoritesSerializer.new(favorite_location)
    else
      render json: {}, status: 401
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if params[:api_key] && user
      render json: FavoritesSerializer.new(user.favorites)
    else
      render json: {}, status: 401
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    if params[:api_key] && user
      favorite = Favorite.find_by(location: params[:location])
      favorite.destroy
      render json: favorite
    else
      render json: {}, status: 401
    end

  end

end
