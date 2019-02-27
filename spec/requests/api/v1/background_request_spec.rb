require 'rails_helper'

describe 'background endpoint' do
  it 'sends image link', :vcr do
    get "/api/v1/backgrounds?location=denver,co"

    expect(response).to be_successful
    image = response.body
    expect(image[0..11]).to eq("https://farm")
  end
end
