class BestbuyController < ApplicationController

  def index
    if Product.all(params[:q])
      @products = Product.all(params[:q])
    else
      render text: "404"
    end
  end
end
