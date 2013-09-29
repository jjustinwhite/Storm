class Location < ActiveRecord::Base
	attr_accessible :address, :latitude, :longitude
	geocoded_by :address # can also be an IP address
  	reverse_geocoded_by :latitude, :longitude do |address,results|
  		if geo = results.first
    		address.city = geo.city
    		address.state = geo.state
    		address.street = geo.address
    		address.country = geo.country
  		end
	end
	after_validation :geocode, :reverse_geocode # auto-fetch address	
  	validates :address, :presence => true
end
