class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def get_weather_image(icon)
		icons = {"clear-day" => "CLEAR_DAY", "clear-night" => "CLEAR_NIGHT", "partly-cloudy-day" => "PARTLY_CLOUDY_DAY", "partly-cloudy-night" => "PARTLY_CLOUDY_NIGHT", "cloudy" => "CLOUDY", "rain" => "RAIN", "sleet" => "SLEET", "snow" => "SNOW", "wind" => "WIND", "fog" => "FOG"}
		return icons[icon]
	end

	def get_temperature_info(temp)
    temp = temp.round
    return temp
  end

  def get_summary_description(summary)
    #Placeholder method. Fill In.
    #Check which summary it is and return correct description
    return summary
  end

end
