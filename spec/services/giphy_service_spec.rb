require 'rails_helper'

describe GiphyService do
  it 'can make calls', :vcr do
    response = GiphyService.retrieve_gif("partly-cloudy-night")
    expect(response[0..4]).to eq("https")
  end
end
