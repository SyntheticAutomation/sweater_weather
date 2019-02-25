class Api::V1::ForecastController < ApplicationController

  def index
    #consider sanitizing params[:location] before the service call
    #consider having a list of cities and states for input recognition
    raw_city = params[:location].split(",")[0]
    raw_city.include?(" ") ? city = raw_city.gsub(' ', '%20') : city = raw_city
    state = params[:location][-2..-1]
    render json: ForecastSerializer.new(Forecast.new(city, state))
  end

end
