require 'httparty'
require 'json'

class WeatherLookup
  attr_accessor :today, :hourly

  def initialize
    response_hrly = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/hourly/q/60657.json')
    response_fcast = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/forecast/q/60657.json')
    assign_values(response_hrly,response_fcast)
  end

  def assign_values(response_hrly, response_fcast)
    self.today = {
       date: response_hrly['hourly_forecast'][0]['FCTTIME']['weekday_name'] + response_hrly['hourly_forecast'][0]['FCTTIME']['month_name'] + response_hrly['hourly_forecast'][0]['FCTTIME']['mday_padded'] + response_hrly['hourly_forecast'][0]['FCTTIME']['year'],
       high: response_fcast['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit'],
       low:  response_fcast['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit'],
       condition:   response_hrly['hourly_forecast'][0]['condition'],
       icon:        response_hrly['hourly_forecast'][0]['icon'],
       humidity:    response_hrly['hourly_forecast'][0]['humidity'],
       feelslike:   response_hrly['hourly_forecast'][0]['feelslike']['english'],
       chance_rain: response_hrly['hourly_forecast'][0]['pop'],
       snow_inches: response_hrly['hourly_forecast'][0]['snow']['english']
      }

    self.hourly = []

    10.times do |single_hour|
      time_temp = {
          time: response_hrly['hourly_forecast'][single_hour]['FCTTIME']['civil'],
          temp: response_hrly['hourly_forecast'][single_hour]['temp']['english']
      }
      self.hourly << time_temp
    end
  end

end