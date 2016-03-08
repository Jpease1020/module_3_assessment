class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(10)
  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end
