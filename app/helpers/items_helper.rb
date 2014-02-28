module ItemsHelper

  def format_price price
    "$#{price.round(2)}"
  end

end
