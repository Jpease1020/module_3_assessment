class BestbuyController < ApplicationController

  def index
    @products = Product.all(params[:q])
    # @products = BestbuyService.new.product_search(params[:q])
  end
end
