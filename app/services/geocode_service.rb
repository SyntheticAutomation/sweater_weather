class GeocodeService

  def self.retrieve_coordinates(location)
    response = get_uri('/maps/api/geocode/json?', location)
    response[:results][0][:geometry][:location]
  end

  def self.get_uri(address, location)
    response = engage_faraday.get(address) do |req|
      req.params['address'] = location
      req.params['key'] = ENV['google_geocode_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: "https://maps.googleapis.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
