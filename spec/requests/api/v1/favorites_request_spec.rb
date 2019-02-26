require 'rails_helper'

describe 'favorites endpoint' do
  it 'can create a favorite location for an existing user' do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/favorites?location=denver,co&api_key=#{key}"
    expect(response).to be_successful
  end
end
