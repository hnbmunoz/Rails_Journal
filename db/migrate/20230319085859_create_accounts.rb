class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.integer :user_ID    
      t.integer :account_type_ID
      t.string :username
      t.string :password
      t.text :authentication_token     
    end
  end
end
