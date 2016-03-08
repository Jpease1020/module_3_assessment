require 'rails_helper'

describe "api/v1/item/:id returns an item serialized" do
  describe "GET /api/v1/items/:id" do
    it "returns an item with name, description, image url but not created at or updataed at" do
      20.times do |i|
        Item.create!(name: "item#{i}",
              description: "description#{i}",
                image_url: "image_url#{i}")
      end

      get "/api/v1/items/1", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      item = JSON.parse(response.body)
      assert_equal "item0", item['name']

      get "/api/v1/items/12", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      item = JSON.parse(response.body)
      assert_equal "item11", item['name']
    end
  end
end
