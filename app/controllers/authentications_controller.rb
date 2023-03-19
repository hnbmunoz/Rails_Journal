class AuthenticationsController < ApplicationController
  def new_user
    puts form_params
  end

  private
  def form_params
    params.permit(:first_name, :last_name, :username, :email, :password, :confirm_password)  
  end

end