class GiphySerializer
  include FastJsonapi::ObjectSerializer
  attribute :images, :copyright

end
