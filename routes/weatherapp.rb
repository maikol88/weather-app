require 'sinatra'
require 'httparty'
require 'json'
require 'pry'

before do
  content_type 'application/json', 'charset' => 'utf-8'
end

get '/' do
  response_hrly = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/hourly/q/60657.json')
  response_fcast = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/forecast/q/60657.json')

  {
      today: {
          date: response_hrly['hourly_forecast'][0]['FCTTIME']['weekday_name'] + " " + response_hrly['hourly_forecast'][0]['FCTTIME']['month_name'] + " " + response_hrly['hourly_forecast'][0]['FCTTIME']['mday_padded'] + " " + response_hrly['hourly_forecast'][0]['FCTTIME']['year'],
          high: response_fcast['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit'],
          low: response_fcast['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit'],
          condition: response_hrly['hourly_forecast'][0]['condition'],
          icon: response_hrly['hourly_forecast'][0]['icon'],
          humidity: response_hrly['hourly_forecast'][0]['humidity'],
          feelslike: response_hrly['hourly_forecast'][0]['feelslike']['english'],
          pop: response_hrly['hourly_forecast'][0]['pop'],
          snow: response_hrly['hourly_forecast'][0]['snow']['english']
      },
      hourly: [
          {
              hour: response_hrly['hourly_forecast'][0]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][0]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][1]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][1]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][2]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][2]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][3]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][3]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][4]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][4]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][5]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][5]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][6]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][6]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][7]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][7]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][8]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][8]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][9]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][9]['temp']['english']
          },
          {
              hour: response_hrly['hourly_forecast'][10]['FCTTIME']['civil'],
              temp: response_hrly['hourly_forecast'][10]['temp']['english']
          }
      ]
  }.to_json
end