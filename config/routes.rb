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
  get 'tasks/all' => 'tasks#my_tasks', as: 'show_my_tasks_entry'

  # "/pages/entries/tasks/create
  # post '/pages/entries/tasks/create(.:format)' => 'tasks#create', as: 'create_new_task'
  post '/pages/entries/tasks/create(.:format)' => 'entries#create_task'
  delete '/pages/entries/tasks/delete(.:format)' => 'entries#delete_task'
  patch '/pages/entries/tasks/edit(.:format)' => 'entries#edit_task'
  
  get '/pages/entries/categories/all' => 'categories#my_categories', as: 'all_categories_entry'
  post '/pages/entries/categories/create(.:format)' => 'entries#create_category'
  patch '/pages/entries/categories/edit(.:format)' => 'entries#edit_category'
  patch '/pages/entries/categories/disable(.:format)' => 'entries#disable_category'
  post '/pages/categories/create(.:format)' => 'categories#create'
  # axios routes


  # post '/' => "authentications#new_user"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "pages#index"

end
