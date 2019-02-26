require 'rails_helper'

describe 'favorites endpoint' do
  it 'can create a favorite location for an existing user' do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/favorites?location=miami,fl&api_key=#{key}"
    expect(response).to be_successful
    parsed_favorite = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(parsed_favorite[:location]).to eq("miami,fl")
  end
end
