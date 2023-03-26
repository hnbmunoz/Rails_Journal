class CategoriesController  < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    puts category_params   
    @new_category = Repository.create_new_category(cookies[:gen_token],category_params )
    if @new_category
      head :ok, { msg: "Successfully Saved" }
    else
      head :precondition_failed, { msg: "Failed to save new category" }
    end 
  end

  def my_categories
    @logged_account = Account.find_by( "authentication_token": cookies[:gen_token])
    pp @logged_account
    @categories = Category.all
    @filtered = []

    @categories.each do | obj| 
      if obj.account_ID == @logged_account.id
        @filtered.push(obj)
      end
    end
    
    render json: @filtered
  end

  private
  def category_params
    params.permit(:category_title, :category_comment)  
  end
end