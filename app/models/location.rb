class Location < ApplicationRecord
  validates_presence_of :city, :state, :latitude, :longitude
  validates_uniqueness_of :latitude, :longitude
end
