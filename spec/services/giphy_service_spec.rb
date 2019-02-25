require 'rails_helper'

describe GiphyService do
  it 'can make calls' do
    response = GiphyService.retrieve_gifs("partly-cloudy-night")
    expect(response.first[:images][:fixed_width][:url][0..4]).to eq("https")
  end
end
