class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  def current_weather
    raw_city = location.split(",")[0]
    raw_city.include?(" ") ? city = raw_city.gsub(' ', '%20') : city = raw_city
    state = location[-2..-1]
    forecast = Forecast.new(city, state)
    current = forecast.right_now
  end
end
