require 'rails_helper'

describe 'account creation endpoint', :vcr do
  it 'can create a new user' do
    email = Faker::Internet.email
    post "/api/v1/users?email=#{email}&password=password&password_confirmation=password"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"]["attributes"]["api_key"].class).to eq(String)
  end
end
