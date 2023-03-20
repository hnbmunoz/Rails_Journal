class Repository
  def self.create_user_account(new_user)
    @user_details = User.new("first_name": new_user['first_name'], "last_name": new_user['last_name'], "user_mail": new_user['email'])
    # @user_details.save
    return false if !(@user_details.save)
    
    @account_details = Account.new( "user_ID":  7, "account_type_ID": 1, "username": new_user['username'], "password": new_user['password'], "authentication_token": "randomBS")
    
    print @account_details.errors.full_messages
    @account_details.save
  end

end