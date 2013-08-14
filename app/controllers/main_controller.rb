require 'weather_forecast'
require 'Time'


class MainController < ApplicationController

	@chi_lat = -41.8819
	@chi_long = 87.6500

	def get_summary_description(summary)
		#Placeholder method. Fill In.
		#Check which summary it is and return correct description
		return summary
	end

	def get_weather_image(icon)
		#Placeholder method. Fill In.
		#Take in the string of what Icon it is, ex. cloudy
		#Then return the name of the image file that we have in our rails app(Need to find icons)
		return icon
	end

	def index
		@hi = Weather_Forecast.hi
		@weather_json = Weather_Forecast.get_forecast(-41.8819, 87.6500)
		@time = Time.at(@weather_json["currently"]["time"])
		@summary = get_summary_description(@weather_json["currently"]["summary"])
		@icon = get_weather_image(@weather_json["currently"]["icon"])
	end
end
