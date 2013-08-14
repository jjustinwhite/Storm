require 'weather_forecast'

class MainController < ApplicationController

	attr_accessor :weather_forecast

	@chi_lat = -41.8819
	@chi_long = 87.6500

	def index
		@hi = Weather_Forecast.hi
		@weather_json = Weather_Forecast.get_forecast(-41.8819, 87.6500)

		puts "THE WEATHER JSON #{:weather_json}"
	end
end
