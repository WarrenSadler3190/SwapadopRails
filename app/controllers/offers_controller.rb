require 'rubygems'
require 'twilio-ruby'


class OffersController < ApplicationController
  def create

    # @offer = Offer.new
    # @offer.value = params[:value]
    # @offer.message = params[:message]
    # @offer.user = User.find(params[:user])
    # @offer.item = Item.find(params[:item])

    @item = Item.find(params[:item_id])
    current_user.offers.create(:item_id => @item.id)

    account_sid = 'ACe102db41da3996283de0e7978eaafc99'
    auth_token = '9966ddac530c709b01d6e2b82faac952'
    @client = Twilio::REST::Client.new account_sid, auth_token  

    @client.account.messages.create(
      :from=> "+16158236067",
      :to=> "+16154954452",
      :body=> "Hey #{current_user.name} wants to trade! Contact them at #{current_user.email}."
    )

    UserMailer.offer_trade(@item, current_user)
    redirect_to item_path(@item), notice: 'Offer was successfully sent!'
 
  end
end
