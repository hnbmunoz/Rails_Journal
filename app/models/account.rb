class Account < ApplicationRecord
  # belongs_to :user
  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :user_ID, presence: true
  
end
