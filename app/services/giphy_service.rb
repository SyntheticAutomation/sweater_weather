class GiphyService

  def self.retrieve_gif(search_words)
    get_uri('/v1/gifs/search', search_words)[:data].sample[:images][:fixed_width][:url]
  end

  def self.get_uri(address, search_words)
    response = engage_faraday.get(address) do |req|
      req.params['q'] = search_words
      req.params['api_key'] = ENV['giphy_api_key']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: "https://api.giphy.com") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

end
