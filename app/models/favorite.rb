class Favorite < ApplicationRecord
  validates_presence_of :location
  belongs_to :user

  def current_weather
    forecast = Forecast.new(location)
    current = forecast.right_now
  end
end
