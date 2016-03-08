class BestbuyService

  def initialize
    conn = Faraday.new(:url => 'http://sushi.com') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def search(search_words)

  end
end

# https://api.bestbuy.com/v1/products(search=sennheiser)?format=json&show=sku,name,customerReviewAverage,shortDescription,image,salePrice&pageSize=15&apiKey=57f9xyfxh9ujc522eek6ugd4
