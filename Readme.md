# Weather app - 1cbb81868ae6e47c


By Ricardo and Miguel Saldana

Made in Ruby


RAILS RAN:
gem install rails
rails new weatherapp --database=postgresql
rails g controller pages index
in routes:get 'status', to: 'pages#status'
in controller: def status
                   render json:"I'm alive".to_json
                 end

NEXT STEPS:
refactor routes ()
add routes for status