class OffersController < ApplicationController
  def send_offer
    user = User.find(params[:user])
    item = Item.find(params[:item])
    UserMailer.offer_trade(item, user)
    redirect_to swapadopolis_index_path, notice: 'Offer was successfully sent!'
  end
end
