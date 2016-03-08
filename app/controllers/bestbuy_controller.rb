class BestbuyController < ApplicationController

  def search
    response = BestbuyService.new.search(params[:q])
  end
end
