require 'httparty'
require 'json'
require 'pry'

response = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/hourly/q/60657.json')

# weekday
puts response['hourly_forecast'][0]['FCTTIME']['weekday_name']

# month
puts response['hourly_forecast'][0]['FCTTIME']['month_name']

# day
puts response['hourly_forecast'][0]['FCTTIME']['mday_padded']

# year
puts response['hourly_forecast'][0]['FCTTIME']['year']

# time
puts response['hourly_forecast'][0]['FCTTIME']['civil']

# temperature
puts 'Temperature: ' + response['hourly_forecast'][0]['temp']['english']

# condition
puts 'Condition: ' + response['hourly_forecast'][0]['condition']

# humidity
puts 'Humidity: ' + response['hourly_forecast'][0]['humidity']

# Feels like
puts 'Feels like: ' + response['hourly_forecast'][0]['feelslike']['english']
