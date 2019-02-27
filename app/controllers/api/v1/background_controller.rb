class Api::V1::BackgroundController < ApplicationController

  def show
    render json: FlickrService.retrieve_photo_from_location(params[:location])
  end

end
