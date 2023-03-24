class PagesController < ApplicationController
  def index
    @allow_access = Repository.allow_access(cookies[:gen_token])

    if @allow_access
      @account = Account.find_by("authentication_token": cookies[:gen_token])
      @journal = Journal.find_by("account_ID": @account.id)
    
      redirect_to "/pages/dashboard"
    end
  end

  def dashboard   
    @allow_access = Repository.allow_access(cookies[:gen_token])
    if @allow_access
      @account = Account.find_by("authentication_token": cookies[:gen_token])
      @journal = Journal.find_by("account_ID": @account.id)
    else
      redirect_to "/"
    end   
  end

  def journal_entries
    @selected_journal = Journal.find(params["id"])

    pp @selected_journal
   
  end

end
