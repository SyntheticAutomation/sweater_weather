class GeocodeService

  def self.retrieve_coordinates(city, state)
    response = get_uri('/lookup', city, state)
    response[0][:zipcodes].find { |zipcode| zipcode[:default_city] == "Denver" }
  end

  def self.get_uri(address, city, state)
    response = engage_faraday.get(address) do |req|
      req.params['auth-id'] = ENV['smarty_streets_auth_id']
      req.params['auth-token'] = ENV['smarty_streets_auth_token']
      req.params['city'] = city
      req.params['state'] = state
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: "https://us-zipcode.api.smartystreets.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end



end
