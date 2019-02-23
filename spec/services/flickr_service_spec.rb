require 'rails_helper'

describe FlickrService do
  it 'can make calls', :vcr do
    lat = 39.6909
    long = -104.91112
    response = FlickrService.retrieve_photo_from_location(lat, long)
    expect(response.class).to eq(String)
    expect(response[0..11]).to eq("https://farm")
  end
end
