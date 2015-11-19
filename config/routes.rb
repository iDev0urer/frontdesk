Rails.application.routes.draw do

  root 'static#index'

  get 'register', to: 'tenant#new_session'
  get 'login', to: 'tenant#new_registration'
end
