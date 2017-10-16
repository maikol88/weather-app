require 'httparty'
require 'json'
require 'pry'

# Request for hourly forecast
response_hrly = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/hourly/q/60657.json')
# Request for day forecast
response_fcast = HTTParty.get('http://api.wunderground.com/api/1cbb81868ae6e47c/forecast/q/60657.json')
# One call to specify todays date from response
puts 'Today\'s date:'
puts "#{response_hrly['hourly_forecast'][0]['FCTTIME']['weekday_name']}, #{response_hrly['hourly_forecast'][0]['FCTTIME']['month_name']} #{response_hrly['hourly_forecast'][0]['FCTTIME']['mday_padded']} #{response_hrly['hourly_forecast'][0]['FCTTIME']['year']}"
puts 'High: '     + response_fcast['forecast']['simpleforecast']['forecastday'][0]['high']['fahrenheit']
puts 'Low: '      + response_fcast['forecast']['simpleforecast']['forecastday'][0]['low']['fahrenheit']

# 10 hours every two hours(work hours and return home)
# time and temp
puts "#{response_hrly['hourly_forecast'][0]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][0]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][1]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][1]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][2]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][2]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][3]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][3]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][4]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][4]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][5]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][5]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][6]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][6]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][7]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][7]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][8]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][8]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][9]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][9]['temp']['english']}"
puts "#{response_hrly['hourly_forecast'][10]['FCTTIME']['civil']}, temp: #{response_hrly['hourly_forecast'][10]['temp']['english']}"

puts 'Details: '
# condition
puts 'Condition: '      + response_hrly['hourly_forecast'][0]['condition']
# Icon, can be used to determine our icon we will use
puts 'Icon: '      + response_hrly['hourly_forecast'][0]['icon']
# humidity
puts 'Humidity: '       + response_hrly['hourly_forecast'][0]['humidity']
# Feels like
puts 'Feels like: '     + response_hrly['hourly_forecast'][0]['feelslike']['english']
# Probability of precipitation
puts 'Chance of rain: ' + response_hrly['hourly_forecast'][0]['pop']
# Snow inches(probably used only on snow months)
puts 'Snow: ' + response_hrly['hourly_forecast'][0]['snow']['english']
puts '###########'

# Forecast for next 2 days
# Basic time
puts 'Next day'
puts  response_fcast['forecast']['txt_forecast']['forecastday'][2]['title'] # We can use the icon value to match our image if it contains words like "cloudy"
puts  response_fcast['forecast']['txt_forecast']['forecastday'][2]['fcttext']
puts 'Icon name: ' + response_fcast['forecast']['txt_forecast']['forecastday'][2]['icon']

# Should be period 2 for next day
puts 'Period(Should be 2 for next day): ' + response_fcast['forecast']['simpleforecast']['forecastday'][1]['period'].to_s
puts 'High: '     + response_fcast['forecast']['simpleforecast']['forecastday'][1]['high']['fahrenheit']
puts 'Low: '      + response_fcast['forecast']['simpleforecast']['forecastday'][1]['low']['fahrenheit']

puts '##########'
puts '2 days after'
# 2 days after
puts  response_fcast['forecast']['txt_forecast']['forecastday'][4]['title']
puts  response_fcast['forecast']['txt_forecast']['forecastday'][4]['fcttext']
puts 'Icon name: ' + response_fcast['forecast']['txt_forecast']['forecastday'][4]['icon']

# Should be period 4 for next day
puts 'Period(Should be 4 for next day): ' + response_fcast['forecast']['simpleforecast']['forecastday'][3]['period'].to_s
puts 'High: '     + response_fcast['forecast']['simpleforecast']['forecastday'][3]['high']['fahrenheit']
puts 'Low: '      + response_fcast['forecast']['simpleforecast']['forecastday'][3]['low']['fahrenheit']
