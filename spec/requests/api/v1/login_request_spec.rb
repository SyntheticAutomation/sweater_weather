require 'rails_helper'

describe 'login endpoint' do
  it 'can create a session for an existing user' do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/sessions?email=#{user.email}&password=password"
    expect(response).to be_successful
    parsed_response = JSON.parse(response.body)
    expect(parsed_response["data"]["attributes"]["api_key"].class).to eq(String)
  end
end
