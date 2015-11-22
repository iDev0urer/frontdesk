Rails.application.routes.draw do

  constraints subdomain: /./ do
    root to: 'tenant#index', as: 'tenant_root'
    get 'login', to: 'tenant#new_session'
  end

  root to: 'static#index', as: 'root'

  get 'register', to: 'tenant#new_registration', as: 'register_tenant'
  post 'register', to: 'tenant#create_registration', as: 'post_register_tenant'

end
