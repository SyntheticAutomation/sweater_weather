require 'rails_helper'

describe 'favorites endpoint' do
  it 'can create a favorite location for an existing user', :vcr do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)

    post "/api/v1/favorites?location=miami,fl&api_key=#{key}"

    expect(response).to be_successful
    parsed_favorite = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(parsed_favorite[:location]).to eq("miami,fl")
  end

  it 'returns 401 when invalid user' do
    post "/api/v1/favorites?location=miami,fl&api_key=000"

    expect(status).to be(401)
  end

  it 'returns 401 when no api_key given' do
    post "/api/v1/favorites?location=miami,fl"

    expect(status).to be(401)
  end

  it 'sends all favorites for existing user', :vcr do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/favorites?location=miami,fl&api_key=#{key}"
    post "/api/v1/favorites?location=denver,co&api_key=#{key}"
    post "/api/v1/favorites?location=montgomery,al&api_key=#{key}"

    get "/api/v1/favorites?api_key=#{user.api_key}"
    expect(response).to be_successful
    parsed_list = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_list[:data][0][:attributes][:location]).to eq('miami,fl')
    expect(parsed_list[:data][1][:attributes][:location]).to eq('denver,co')
    expect(parsed_list[:data][1][:attributes][:current_weather][:summary].class).to eq(String)
  end

  it 'returns 401 when invalid user' do
    post "/api/v1/favorites?api_key=000"

    expect(status).to be(401)
  end

  it 'returns 401 when no api_key given' do
    post "/api/v1/favorites"

    expect(status).to be(401)
  end

  it 'can delete a favorite and return the deleted item' do
    key = SecureRandom.urlsafe_base64
    email = Faker::Internet.email
    user = User.create(email: email, password: "password", api_key: key)
    post "/api/v1/favorites?location=miami,fl&api_key=#{key}"
    post "/api/v1/favorites?location=denver,co&api_key=#{key}"
    delete "/api/v1/favorites?location=miami,fl&api_key=#{key}"

    expect(response).to be_successful
    parsed_response = JSON.parse(response.body, symbolize_names: true)
    expect(parsed_response[:location]).to eq("miami,fl")
  end

end
