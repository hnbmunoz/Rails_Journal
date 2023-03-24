Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/login'
  get 'pages/register'

  get 'pages/categories/all' => 'categories#my_categories', as: 'show_my_categories'
  


  post '/authentications/signUp(.:format)' => 'authentications#new_user'
  post '/authentications/signIn(.:format)' => 'authentications#verify_user'
  post '/authentications/signOut' => 'authentications#clear_user'

  post '/pages/categories/create(.:format)' => 'categories#create'
  
  # post 'pages/categories/create' => 'categories#create'
   
  get '/' => "pages#index"
  get 'pages/dashboard' => "pages#dashboard"
  get 'pages/entries/:id(.:format)' => 'pages#journal_entries', as: 'show_journal_entries'
  # post '/' => "authentications#new_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "pages#index"

end
