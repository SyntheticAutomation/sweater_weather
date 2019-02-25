class Api::V1::ForecastController < ApplicationController

  def index
    #consider sanitizing params[:location] before the service call
    #consider having a list of cities and states for input recognition
    #consider moving these into a PORO
    city = params[:location][0..-4]
    state = params[:location][-2..-1]
    zipcode_object = GeocodeService.retrieve_coordinates(city, state)
    forecast_data = DarkskyService.retrieve_weather(
      zipcode_object[:latitude],
      zipcode_object[:longitude]
    )
    render json: forecast_data
  end

end
