class DarkskyService

  def self.retrieve_weather(location)
    coordinates = GeocodeService.retrieve_coordinates(location)
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
