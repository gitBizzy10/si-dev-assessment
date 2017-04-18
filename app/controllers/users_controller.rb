class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to action: "show", id: @user.id
    else
      redirect_to action: "new"
    end
  end

private



  def user_params
    params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
  end

require 'twilio-ruby'

account_sid = "AC55b1fc93d41fc9a9d5d8e3c5125c3f0e" # Your Account SID from www.twilio.com/console
auth_token = "{{ 712b4d20dcb4107cda86465794724581 }}"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
      :to => "+14324137957",    # Replace with your phone number
    :from => "+15123573303")  # Replace with your Twilio number

puts message.sid

end
