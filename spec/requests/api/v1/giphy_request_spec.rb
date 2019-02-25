require 'rails_helper'

describe 'giphy api' do
  it 'sends gifs with params' do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    parsed_gifs = JSON.parse(response.body)
    expect(parsed_gifs["data"]["attributes"]["images"][0]["time"].class).to eq(Integer)
  end
end
