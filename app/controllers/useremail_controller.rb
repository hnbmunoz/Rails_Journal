class UserEmailController < ApplicationController
  def send_email
     p params[:subject]
  end
end