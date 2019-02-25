class Api::V1::ForecastController < ApplicationController

  def index
    #consider sanitizing params[:location] before the service call
    #consider having a list of cities and states for input recognition
    city = params[:location][0..-4]
    state = params[:location][-2..-1]
    render json: ForecastSerializer.new(Forecast.new(city, state))
  end

end
