class PagesController < ApplicationController
  def index
    @weather_lookup = WeatherLookup.new()
  end

  def status
    render json:"I'm alive".to_json
  end

  def get_zipcode

  end

end
