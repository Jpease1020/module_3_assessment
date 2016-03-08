class BestbuyService

  attr_reader :conn
  def initialize
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def product_search(search_words)
    search_words = search_words.split(" ")
    search_words = search_words.map do |word|
      "search=#{word}"
    end
    byebug
    conn.get do |req|
      req.url "products(search=#{search_words})"
      req.params['format']     = 'json'
      req.params['show']   = 'sku,name,customerReviewAverage,shortDescription,image,salePrice'
      req.params['pageSize'] = 15
      req.params['apiKey'] = '57f9xyfxh9ujc522eek6ugd4'
    end
  end
end

# https://api.bestbuy.com/v1/products(search=sennheiser)?format=json&show=sku,name,customerReviewAverage,shortDescription,image,salePrice&pageSize=15&apiKey=57f9xyfxh9ujc522eek6ugd4
