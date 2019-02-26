require 'rails_helper'

describe 'account creation endpoint' do
  it 'sends api_key' do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/sessions?email=#{user.email}&password=password"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"]["attributes"]["api_key"].class).to eq(String)
  end
end
