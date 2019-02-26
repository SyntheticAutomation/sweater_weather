require 'rails_helper'

describe DarkskyService do
  it 'can make calls', :vcr do
    response = DarkskyService.retrieve_weather("denver,co")
    expect(response[:latitude]).to eq(39.7392358)
    expect(response[:currently][:ozone].class).to eq(Float)
  end
end
