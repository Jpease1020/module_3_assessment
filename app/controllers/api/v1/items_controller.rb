class Api::V1::ItemsController < Api::ApiController
  respond_to :json
  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params[:id].to_i)
  end

  def create
    item = Item.new(item_params)
    respond_with item
  end

  def destroy
    respond_with Item.find(params[:id]).delete
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
