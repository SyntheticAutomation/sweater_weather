class Forecast

  attr_reader :city, :state, :id

  def initialize(city, state)
    @city = city
    @state = state
    @id = generate_weather_data[:currently][:time]
  end

  def coordinates
    GeocodeService.retrieve_coordinates(@city, @state)
  end

  def generate_weather_data
    DarkskyService.retrieve_weather(coordinates[:latitude], coordinates[:longitude])
  end

  def right_now
    generate_weather_data[:currently]
  end

  def hourly
    generate_weather_data[:hourly]
  end

  def daily
    generate_weather_data[:daily]
  end
end
