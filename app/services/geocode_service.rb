class GeocodeService

  def self.retrieve_coordinates(zip)
    get_uri('/lookup', zip)
  end
  
  def self.get_uri(address, zip)
    response = engage_faraday.get(address) do |req|
      req.params['auth-id'] = ENV['smarty_streets_auth_id']
      req.params['auth-token'] = ENV['smarty_streets_auth_token']
      req.params['zipcode'] = zip
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: "https://us-zipcode.api.smartystreets.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end



end
