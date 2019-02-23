require 'rails_helper'

describe DarkskyService do
  it 'can make calls', :vcr do
    response = DarkskyService.retrieve_weather(39.6909, -104.91112)
    expect(response[:latitude]).to eq(39.6909)
    expect(response[:currently][:ozone].class).to eq(Float)
  end
end
