Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/login'
  get 'pages/register'


  post '/authentications/signUp(.:format)' => 'authentications#new_user'
  get '/' => "pages#index"
  get 'pages/dashboard' => "pages#dashboard"
  # post '/' => "authentications#new_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "pages#index"

end
