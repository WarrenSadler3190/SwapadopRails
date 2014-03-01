require 'semantics3'
require 'oauth-plugin'

class ItemsController < ApplicationController
  before_action :authenticate_user!, :set_item, only: [:show, :edit, :update, :destroy]
  # GET /items/search
  def search
    params
    sem3 = Semantics3::Products.new('SEM3822725EA1A9833FE63D5B25D18EA7BA2','ZmQ0YTdjYjgyZjc5ZDg2NmM2NzUzOWQ3YjZkOWYyZjA')
    sem3.products_field( "name", params[:q] )
    productsHash = sem3.get_products
    @query = "Results of query:\n",productsHash.to_json
    binding.pry

  end  

  # GET /items
  # GET /items.json
  def index
    @items = current_user.items
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    # @item = Item.new
    @item = current_user.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # @item = Item.new(item_params)
    @item = current_user.items.build(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:title, :desc, :price, :condition, :user_id, :image)
    end
end
