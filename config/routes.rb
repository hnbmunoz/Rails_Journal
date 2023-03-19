Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/login'
  get 'pages/register'

  post '/authentications(.:format)' => 'authentications#new_user'
  get '/' => "pages#index"
  # post '/' => "authentications#new_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "pages#index"

end
