Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/login'
  get 'pages/register'

  #rails routes
  post '/authentications/signUp(.:format)' => 'authentications#new_user'
  post '/authentications/signIn(.:format)' => 'authentications#verify_user'
  post '/authentications/signOut' => 'authentications#clear_user'
 
  
  # post 'pages/categories/create' => 'categories#create'
  #rails routes
   
  get '/' => "pages#index"
  get 'pages/dashboard' => "pages#dashboard"

  # axios routes
  get 'pages/categories/all' => 'categories#my_categories', as: 'show_my_categories'
  get 'pages/entries/:id(.:format)' => 'pages#journal_entries', as: 'show_journal_entries'
  get 'categories/all' => 'categories#my_categories', as: 'show_my_categories_entry'


  # "/pages/entries/tasks/create
  # post '/pages/entries/tasks/create(.:format)' => 'tasks#create', as: 'create_new_task'
  post '/pages/entries/tasks/create(.:format)' => 'entries#create_task'
  post '/pages/categories/create(.:format)' => 'categories#create'
  # axios routes


  # post '/' => "authentications#new_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "pages#index"

end
