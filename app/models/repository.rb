class Repository 
  def self.create_user_account(new_user)
    @user_details = User.new("first_name": new_user['first_name'], "last_name": new_user['last_name'], "user_mail": new_user['email'])
    # @user_details.save
    return user_details.errors.full_messages if !(@user_details.save)
    
    @account_details = Account.new( "user_ID":  User.last.id, "account_type_ID": 1, "username": new_user['username'], "password": new_user['password'], "authentication_token": "randomCode")

     
    print @account_details.errors.full_messages

    if @account_details.save
      Journal.create("account_ID": Account.last.id, "journal_name": "#{new_user['first_name']}'s Journal" ,"hex": "##{Random.bytes(3).unpack1('H*')}")
      Category.create("account_ID": Account.last.id, "title": "Uncategorized", "annotations": "Miscellaneous")  
      return true
    else
      @account_details.errors.full_messages
    end
  end

  def self.validate_user_account(validate_user)    
    @account = Account.find_by("username": validate_user["username_email"])
    if @account
      @saved_pw = @account.password
    end
    @user = User.find_by("user_mail": validate_user["username_email"])
    if @user
      @account = Account.find_by("user_ID": @user.id)
      # @saved_pw = @user_obj.password
    end
    @generated_token = (0...50).map { ('a'..'z').to_a[rand(26)] }.join 
     #https://stackoverflow.com/questions/88311/how-to-generate-a-random-string-in-ruby

    if @account || @user
      if @account.password == validate_user["password"]
        @account.authentication_token = @generated_token
        @account.save              
        return @generated_token
      else
        return false
      end
    else
      return false
    end

  end

  def self.allow_access(user_token)
    @logged_account = Account.find_by("authentication_token": user_token)
  end

  def self.create_new_category(user_token, category_params)
    puts user_token
    @logged_account = Account.find_by( "authentication_token": user_token)
    @new_category = Category.new("account_ID": @logged_account.id, 
      "title": category_params['category_title'],
      "annotations": category_params['category_comment'])
    @new_category.save()
  end

  def self.create_new_task(user_token, task_params)
    @logged_account = Account.find_by( "authentication_token": user_token)
    @new_task = Task.new("account_ID": @logged_account.id, 
      "category_ID": task_params['category_ID'],
      "journal_ID": task_params['journal_ID'],
      "title": task_params['task_title'],
      "details": task_params['task_description'],
      "created": task_params['task_created'].to_datetime,
      "deadline": task_params['task_deadline'].to_datetime)
    @new_task.save()
  end

  

end