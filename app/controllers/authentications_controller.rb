class AuthenticationsController < ApplicationController
  @@error_notice
  def new_user
    pp form_params
    @status = Repository.create_user_account(form_params)   
   
    puts @status
    #add function here to post errors in creating account
    redirect_to '/'
  end

  def verify_user   
    @token = Repository.validate_user_account(verify_params)
    respond_to do |format|
      if @token   
        puts 'saving cookies'    
        cookies[:gen_token] = @token 
        format.html { redirect_to "/pages/dashboard",  allow_other_host: true }
      else
        format.html { redirect_to '/', notice: 'Invalid Email or Password.' }
      end
    end
  end

  def clear_user
    
    cookies[:gen_token] = ''
    redirect_to '/'
  end

  private
  def form_params
    params.permit(:first_name, :last_name, :username, :email, :password, :confirm_password)  
  end

  def verify_params
    params.permit( :username_email, :password )  
  end
end