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
		MainController.latitude = params[:latitude]
		MainController.longitude = params[:longitude]
		redirect_to :get_forecast
	end
end