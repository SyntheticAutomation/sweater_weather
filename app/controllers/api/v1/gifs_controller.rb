class Api::V1::GifsController < ApplicationController

  def index
    city = params[:location].split(",")[0]
    state = params[:location][-2..-1]
    render json: GiphySerializer.new(Forecast.new(city,state))
  end

end
