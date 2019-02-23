class FlickrService

  def self.retrieve_photo_from_location(latitude, longitude)
    api_response = get_uri("/services/rest/?method=flickr.photos.search&api_key=#{ENV['flickr_key']}&tags=skyline%2Clandscape%2Cscenic%2Cphotography&safe_search=1&lat=#{latitude}&lon=#{longitude}&per_page=500&format=json&nojsoncallback=1")
    flickr_api_image = select_photo_from(api_response)
    map_photo_to_url(flickr_api_image)
  end

  def self.get_uri(address)
    response = engage_faraday.get(address)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.engage_faraday
    Faraday.new(url: 'https://api.flickr.com') do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.select_photo_from(api_response)
    api_response[:photos][:photo].sample
  end

  def self.map_photo_to_url(flickr_api_image)
    data = {
      :farm => flickr_api_image[:farm],
      :server => flickr_api_image[:server],
      :id => flickr_api_image[:id],
      :secret => flickr_api_image[:secret]
    }
    "https://farm#{data[:farm]}.staticflickr.com/#{data[:server]}/#{data[:id]}_#{data[:secret]}.jpg"
  end

end
