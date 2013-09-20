require 'weather_forecast'
require 'Time'

class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
  end

  def get_summary_description(summary)
    #Placeholder method. Fill In.
    #Check which summary it is and return correct description
    return summary
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @weather_json = Weather_Forecast.get_forecast(@location.latitude, @location.longitude)
    @time = Time.at(@weather_json["currently"]["time"])
    @summary = get_summary_description(@weather_json["currently"]["summary"])
    @icon = get_weather_image(@weather_json["currently"]["icon"])
    @temp = get_temperature_info(@weather_json["currently"]["temperature"])
    @precip = 100 * @weather_json["currently"]["precipProbability"]
    @intensity = 100 * @weather_json["currently"]["precipIntensity"]

    #Daily
    index = 0
    @daily_summary = [], @daily_icon = [], @daily_lowtemp =  [], @daily_hightemp = []

      #5 times to include today and next 4 days
      7.times do
        @daily_summary[index]= get_summary_description(@weather_json["daily"]["data"][index]["summary"])
        @daily_icon[index]=  get_weather_image(@weather_json["daily"]["data"][index]["icon"])
        @daily_lowtemp[index]= get_temperature_info(@weather_json["daily"]["data"][index]["temperatureMin"])
        @daily_hightemp[index]=  get_temperature_info(@weather_json["daily"]["data"][index]["temperatureMax"])

        index = index + 1
      end


    #Hourly
    @hourly_summary = @weather_json["hourly"]["summary"]

    #Minutely
    @minutely_summary = @weather_json["minutely"]["summary"]
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:address, :latitude, :longitude)
    end
end