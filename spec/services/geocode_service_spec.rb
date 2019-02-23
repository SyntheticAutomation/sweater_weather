require 'rails_helper'

describe GeocodeService do
  it 'can make calls', :vcr do
    response = GeocodeService.retrieve_coordinates(80224)
    expect(response[0][:zipcodes][0][:zipcode]).to eq("80224")
  end
end
