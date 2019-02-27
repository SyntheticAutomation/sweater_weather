require 'rails_helper'

describe FlickrService do
  it 'can make calls', :vcr do
    response = FlickrService.retrieve_photo_from_location("denver,co")
    expect(response.class).to eq(String)
    expect(response[0..11]).to eq("https://farm")
  end
end
