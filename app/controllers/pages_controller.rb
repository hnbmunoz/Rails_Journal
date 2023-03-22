class PagesController < ApplicationController
  def index
  end

  def login
  end

  def register
  end

  def dashboard
    
    @allow_access = Repository.allow_access(cookies[:gen_token])
    print cookies[:gen_token]


    if cookies[:gen_token] != nil || cookies[:gen_token] != "" 
      @account = Account.find_by("authentication_token": cookies[:gen_token])
      @journal = Journal.find_by("account_ID": @account.id)
    end
    if cookies[:gen_token] == nil && cookies[:gen_token] == "" 
      redirect_to "/"
    end

   
  end

end
