class Api::V1::GifsController < ApplicationController

  def index
    #use weather data from the Dark Sky API in order to provide animated GIFs using the Giphy API.
    city = params[:location][0..-4]
    state = params[:location][-2..-1]
    forecast = Forecast.new(city, state)
  end

end
