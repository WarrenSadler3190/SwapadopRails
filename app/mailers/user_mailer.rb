class UserMailer < ActionMailer::Base
  default from: "swapadoparom@swapadop.com"

  def offer_trade(item, user)
    @user = user
    @item = item
    @url = 'http://swapadop.com/offer'
    mail(to:'zeek3190@gmail.com',subject:'Someone wants to Swap!')
  end

end
