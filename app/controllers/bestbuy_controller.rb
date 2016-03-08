class BestbuyController < ApplicationController

  def index
    if Product.all(params[:q])
      @products = Product.all(params[:q])
    else
      render 404
    end
  end
end
