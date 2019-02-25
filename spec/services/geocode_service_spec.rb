require 'rails_helper'

describe GeocodeService do
  it 'can make calls', :vcr do
    response = GeocodeService.retrieve_coordinates("denver", "co")
    expect(response[:default_city]).to eq("Denver")
    latitude = response[:latitude]
    longitude = response[:longitude]
    expect(latitude.class).to eq(Float)
    expect(longitude.class).to eq(Float)
  end
end
