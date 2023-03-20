class User < ApplicationRecord
  # has_one :account
  def self.throw_here(new_user)
    pp new_user
   "Done/Fail"
    # redirect_to article_path(@article)
  end
end
