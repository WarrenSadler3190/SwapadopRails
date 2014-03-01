require 'spec_helper'

describe OffersController do

  describe "GET 'send_offer'" do
    it "returns http success" do
      get 'send_offer'
      response.should be_success
    end
  end

end
