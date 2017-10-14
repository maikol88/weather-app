require 'httparty'
require 'json'
require 'pry'

# Request for hourly forecast
response_hrly = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/hourly/q/60657.json')
# Request for day forecast
response_fcast = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/forecast/q/60657.json')
# One call to specify todays date from response
# weekday
puts response_hrly['hourly_forecast'][0]['FCTTIME']['weekday_name']
# month
puts response_hrly['hourly_forecast'][0]['FCTTIME']['month_name']
# day
puts response_hrly['hourly_forecast'][0]['FCTTIME']['mday_padded']
# year
puts response_hrly['hourly_forecast'][0]['FCTTIME']['year']
puts '############'

# PROBABLY 5 hours every two hours to cover 10 hours(work hours and return)
# time
puts response_hrly['hourly_forecast'][0]['FCTTIME']['civil']
# temperature
puts 'Temperature: ' + response_hrly['hourly_forecast'][0]['temp']['english']
# condition
puts 'Condition: ' + response_hrly['hourly_forecast'][0]['condition']
# humidity
puts 'Humidity: ' + response_hrly['hourly_forecast'][0]['humidity']
# Feels like
puts 'Feels like: ' + response_hrly['hourly_forecast'][0]['feelslike']['english']
# Probability of precipitation
puts 'Chance of rain: ' + response_hrly['hourly_forecast'][0]['pop']
# Snow inches(probably used only on snow months)
puts 'Snow : ' + response_hrly['hourly_forecast'][0]['snow']['english']
puts '###########'

# Forecast for next 2 days
# Next day
puts 'Next day: ' + response_fcast['forecast']['txt_forecast']['forecastday'][2]['title']
puts 'Next day: ' + response_fcast['forecast']['txt_forecast']['forecastday'][2]['fcttext']
# 2 days after
puts '2nd day: ' + response_fcast['forecast']['txt_forecast']['forecastday'][4]['title']
puts '2nd day: ' + response_fcast['forecast']['txt_forecast']['forecastday'][4]['fcttext']
