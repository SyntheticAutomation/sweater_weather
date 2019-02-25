require 'rails_helper'

describe 'forecast api' do
  it 'sends forecast with params' do
    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful
    forecast = JSON.parse(response.body)
    expect(forecast["data"]["attributes"]["city"]).to eq("denver")
  end
end
