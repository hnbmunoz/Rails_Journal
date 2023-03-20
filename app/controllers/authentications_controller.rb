class AuthenticationsController < ApplicationController
  def new_user
    @status = Repository.create_user_account(form_params)
   
    puts @status
    redirect_to '/'
  end

  private
  def form_params
    params.permit(:first_name, :last_name, :username, :email, :password, :confirm_password)  
  end

end