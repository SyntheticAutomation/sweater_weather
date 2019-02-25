require 'rails_helper'

describe 'giphy api' do
  it 'sends gifs with params' do
    get '/api/v1/gifs?location=denver,co'

    expect(response).to be_successful
    parsed_gifs = JSON.parse(response.body)
    require "pry"; binding.pry
    expect(parsed_gifs["data"]["attributes"]["city"]).to eq("denver")
  end
end
