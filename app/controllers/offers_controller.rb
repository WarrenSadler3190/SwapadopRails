require 'rubygems'
require 'twilio-ruby'


class OffersController < ApplicationController
  def send_offer
  @user = User.find(params[:user])
  @item = Item.find(params[:item])


  account_sid = 'ACe102db41da3996283de0e7978eaafc99'
  auth_token = '9966ddac530c709b01d6e2b82faac952'
  @client = Twilio::REST::Client.new account_sid, auth_token  

  @client.account.messages.create(
    :from=> "+16158236067",
    :to=> "+16154954452",
    :body=> "Hey #{@user.name} wants to trade!"
  )

  UserMailer.offer_trade(@item, @user)
  redirect_to swapadopolis_index_path, notice: 'Offer was successfully sent!'
 
  end
end
