require 'rails_helper'

describe GeocodeService do
  it 'can make calls', :vcr do
    response = GeocodeService.retrieve_coordinates("denver,co")
    latitude = response[:lat]
    longitude = response[:lng]
    expect(latitude.class).to eq(Float)
    expect(longitude.class).to eq(Float)
    expect(latitude).to eq(39.7392358)
  end
end
