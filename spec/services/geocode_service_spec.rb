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

  it 'saves location data after each call' do
    response = GeocodeService.retrieve_coordinates("denver,co")
    expect(Location.last.city).to eq("denver")
    expect(Location.last.state).to eq("co")
  end
end
