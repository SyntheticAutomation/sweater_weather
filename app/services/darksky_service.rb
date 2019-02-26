class DarkskyService

  def self.stored?(location)
    Location.exists?(city: location.split(",")[0], state: location[-2..-1])
  end

  def self.get_coords(location)
    Location.find_by(city: location.split(",")[0], state: location[-2..-1])
  end

  def self.retrieve_weather(location)
    if stored?(location)
      coordinates = {lat: get_coords(location).latitude, lng: get_coords(location).longitude}
    else
      coordinates = GeocodeService.retrieve_coordinates(location)
    end
    get_uri("/forecast/#{ENV['darksky_secret']}/#{coordinates[:lat]},#{coordinates[:lng]}")
  end

  def self.get_uri(address)
    response = engage_faraday.get(address)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: "https://api.darksky.net") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
