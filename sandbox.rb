{
  today: {
      date: response_hrly['hourly_forecast'][0]['FCTTIME']['weekday_name'] + response_hrly['hourly_forecast'][0]['FCTTIME']['month_name'] + response_hrly['hourly_forecast'][0]['FCTTIME']['mday_padded'] + response_hrly['hourly_forecast'][0]['FCTTIME']['year'],
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
      response_hrly['hourly_forecast'][0]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][1]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][2]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][3]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][4]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][5]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][6]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][7]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][8]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][9]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english'],
      response_hrly['hourly_forecast'][10]['FCTTIME']['civil'] + response_hrly['hourly_forecast'][0]['temp']['english']
  ]
}