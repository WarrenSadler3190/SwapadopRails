class SwapadopolisController < ApplicationController
  def index
    @items = Item.all
  end
end
