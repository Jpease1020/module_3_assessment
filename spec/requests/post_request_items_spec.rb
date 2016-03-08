require 'rails_helper'

describe "post request to api/v1/item/:id returns a new item serialized" do
  describe "POST /api/v1/items" do
    it "creates an item and returns the serialized item as a response" do
      20.times do |i|
        Item.create!(name: "item#{i}",
              description: "description#{i}",
                image_url: "image_url#{i}")
      end
      item_params = {
        item: { "name" => "a new item",
             "description" => "razzle dazzle",
               "image_url" => "this is an image url"
                  }
               }.to_json

     request_headers = {
             "Accept" => "application/json",
             "Content-Type" => "application/json"
           }


      assert_equal 20, Item.count

      post "/api/v1/items", item_params, request_headers
      expect(response.status).to eq 201

      item = JSON.parse(response.body)
      assert_equal "a new item", item['name']
      assert_equal nil, item['created_at']
    end
  end
end
