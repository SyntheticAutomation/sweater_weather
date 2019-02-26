class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :right_now, :hourly, :daily
end
