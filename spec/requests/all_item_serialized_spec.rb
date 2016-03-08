require 'rails_helper'

describe "api/v1/items returns all items serialized" do
  describe "GET /api/v1/items" do
    it "returns all items with name, description, image url but not created at or updataed at" do
      20.times do |i|
        Item.create!(name: "item#{i}",
              description: "description#{i}",
                image_url: "image_url#{i}")
      end

      get "/api/v1/items", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      items = JSON.parse(response.body)
      assert_equal "item0", items.first['name']
      assert_equal "item19", items.last['name']
    end
  end
end
