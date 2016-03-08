class Product

  def self.all(params)
    response = BestbuyService.new.product_search(params)
    hash = JSON.parse(response.body)
    products = hash['products'].map do |product|
      build_object(product)
    end
    products
  end


  private

    def self.build_object(data)
      OpenStruct.new(data)
    end
end
