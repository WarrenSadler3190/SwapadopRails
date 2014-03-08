class SuggestionController < ApplicationController
  def index
    sem3 = Semantics3::Products.new('SEM3822725EA1A9833FE63D5B25D18EA7BA2','ZmQ0YTdjYjgyZjc5ZDg2NmM2NzUzOWQ3YjZkOWYyZjA')
    sem3.products_field( "name", params[:search] )
    productsHash = sem3.get_products
    @query = "Results of query:\n",productsHash
    @price = {}
    @price[:value] =  @query[1]['results'][0]['sitedetails'][0]['latestoffers'][0]['price'].to_f

    respond_to do |format|
      if @price 
        format.html {redirect_to @price['value'], notice: 'Found latest item price!'}
        format.js {}
        format.json {render json: @price['value'], status: :found}
      else
        format.html {render action: "new"}
        format.json {redner json: @price.errors, status: :cant_find_price}
      end 
    end
  end
end
