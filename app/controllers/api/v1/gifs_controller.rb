class Api::V1::GifsController < ApplicationController

  def index
    city = params[:location][0..-4]
    state = params[:location][-2..-1]
    render json: GiphySerializer.new(Forecast.new(city,state))
  end

end
