class Location < ActiveRecord::Base
	attr_accessible :address, :latitude, :longitude
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
  	after_validation :geocode, :reverse_geocode
  	validates :address, :presence => true
end
