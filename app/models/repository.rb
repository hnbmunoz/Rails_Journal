class Repository 
  def self.create_user_account(new_user)
    @user_details = User.new("first_name": new_user['first_name'], "last_name": new_user['last_name'], "user_mail": new_user['email'])
    # @user_details.save
    return false if !(@user_details.save)
    
    @account_details = Account.new( "user_ID":  User.last.id, "account_type_ID": 1, "username": new_user['username'], "password": new_user['password'], "authentication_token": "randomCode")
    
    print @account_details.errors.full_messages
    @account_details.save
  end

  def self.validate_user_account(validate_user)    
    @account = Account.find_by("username": validate_user["username_email"])
    @user = User.find_by("user_mail": validate_user["username_email"])
    @generated_token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join 
     #https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby

    if @account || @user
      if @account.password == validate_user["password"]
        @account.authentication_token = @generated_token
        @account.save
        return true
      else
        return false
      end
    else
      return false
    end

  end

 


end