class Forecast

  attr_reader :location, :id, :copyright

  def initialize(location)
    @location = location
    @id = generate_weather_data[:currently][:time]
    @copyright = Date.today.year
  end

  def generate_weather_data
    DarkskyService.retrieve_weather(location)
  end

  def images
    days_array.each do |day|
      new_word = designate_search_word(day[:summary])
      day[:url] = GiphyService.retrieve_gif(new_word)
    end
  end

  def days_array
    generate_weather_data[:daily][:data].map do |day|
      {time: day[:time], summary: day[:summary]}
    end
  end

  def designate_search_word(summary)
    if summary.downcase.include?("snow")
      "snow"
    elsif summary.downcase.include?("cloudy")
      "cloudy+forecast"
    elsif summary.downcase.include?("rain")
      "rain"
    elsif summary.downcase.include?("foggy")
      "foggy"
    else
      summary.gsub(' ', '+')
    end
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
