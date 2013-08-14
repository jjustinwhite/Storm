require 'weather_forecast'
require 'Time'


class MainController < ApplicationController

	@chi_lat = 41.9278
	@chi_long = -87.6520

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

	def index
		@hi = Weather_Forecast.hi
		@weather_json = Weather_Forecast.get_forecast(41.9278,-87.6520)
		@time = Time.at(@weather_json["currently"]["time"])
		@summary = get_summary_description(@weather_json["currently"]["summary"])
		@icon = get_weather_image(@weather_json["currently"]["icon"])
	end
end


		#if icon == "clear-day"
		#	return "CLEAR_DAY"
		#elseif icon == "clear-night"
		#	return "CLEAR_NIGHT"
		#elseif icon == "partly-cloudy-day"
		#	return "PARTLY_CLOUDY_DAY"
		#elseif icon == "partly-cloudy-night"
		#	return "PARTLY_CLOUDY_NIGHT"
		#elseif icon == "cloudy"
		#	return "CLOUDY"
		#elseif icon == "rain"
		#	return "RAIN"
		#elseif icon == "sleet"
		#	return "SLEET"
		#elseif icon == "snow"
		#	return "SNOW"
		#elseif icon == "wind"
		#	return "WIND"
		#elseif icon == "fog"
		#	return "FOG"
		#end