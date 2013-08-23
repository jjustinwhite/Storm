require 'weather_forecast'
require 'Time'
#require 'geocoder'


class MainController < ApplicationController

	skip_before_filter :verify_authenticity_token 

	@latitude = 41.9278
	@longitude = -87.6520

	class << self
		attr_accessor :latitude, :longitude 
	end
	

	def get_summary_description(summary)
		#Placeholder method. Fill In.
		#Check which summary it is and return correct description
		return summary
	end

	def get_weather_image(icon)
		#I couldn't get my elseif statements to work... sorry for the 10 if statements. lets combine them into an elseif 
		if icon == "clear-day"
			return "CLEAR_DAY"
		end
		if icon == "clear-night"
			return "CLEAR_NIGHT"
		end
		if icon == "partly-cloudy-day"
			return "PARTLY_CLOUDY_DAY"
		end
		if icon == "partly-cloudy-night"
			return "PARTLY_CLOUDY_NIGHT"
		end
		if icon == "cloudy"
			return "CLOUDY"
		end
		if icon == "rain"
			return "RAIN"
		end
		if icon == "sleet"
			return "SLEET"
		end
		if icon == "snow"
			return "SNOW"
		end
		if icon == "wind"
			return "WIND"
		end
		if icon == "fog"
			return "FOG"
		end
	end

	def get_temperature_info(temp)
		temp = temp.round
		return temp
	end

	def index
		@hi = Weather_Forecast.hi
		@weather_json = Weather_Forecast.get_forecast(41.9278, -87.6520)
		@time = Time.at(@weather_json["currently"]["time"])
		@summary = get_summary_description(@weather_json["currently"]["summary"])
		@icon = get_weather_image(@weather_json["currently"]["icon"])
		@temp = get_temperature_info(@weather_json["currently"]["temperature"])
		@precip = 100 * @weather_json["currently"]["precipProbability"]
		@intensity = 100 * @weather_json["currently"]["precipIntensity"]
		@wind= @weather_json["currently"]["windSpeed"]
	end

	def get_forecast
		#x = reverse_geocoded_by MainController.latitude, MainController.longitude
		#after_validation :reverse_geocode
		#puts "THIS HASH"
		#puts x

		@weather_json = Weather_Forecast.get_forecast(MainController.latitude, MainController.longitude)
		@time = Time.at(@weather_json["currently"]["time"])
		@summary = get_summary_description(@weather_json["currently"]["summary"])
		@icon = get_weather_image(@weather_json["currently"]["icon"])
		@temp = get_temperature_info(@weather_json["currently"]["temperature"])
		@precip = 100 * @weather_json["currently"]["precipProbability"]
		@intensity = 100 * @weather_json["currently"]["precipIntensity"]
		@wind= @weather_json["currently"]["windSpeed"]
	end

	def create
		#render text: params[:post].inspect
		#puts "PARAMS"
		#puts params.inspect
		MainController.latitude = params[:latitude]
		MainController.longitude = params[:longitude]
		redirect_to :get_forecast
	end
end