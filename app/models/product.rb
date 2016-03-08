class Product

  def self.all(params)
    response = BestbuyService.new.product_search(params)
    byebug
    products =  JSON.parse(response.body)
  end

end
