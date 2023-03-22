class CategoriesController  < ApplicationController
  def create
    puts 'run this'
    puts cookies[:gen_token]
    # head :no_content
    head :ok 
  end
end