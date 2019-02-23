require 'rails_helper'

describe GeocodeService do
  it 'can make calls', :vcr do
    response = GeocodeService.retrieve_coordinates(80224)
    expect(response[:zipcode]).to eq("80224")
    latitude = response[:latitude]
    longitude = response[:longitude]
    expect(latitude).to eq(39.6909)
    expect(longitude).to eq(-104.91112)
  end
end
