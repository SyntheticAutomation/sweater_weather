class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :city, :state, :right_now, :hourly, :daily
end
