Rails.application.routes.draw do
  root 'pages#index'

  get 'status', to: 'pages#status'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
