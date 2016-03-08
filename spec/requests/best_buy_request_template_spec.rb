require 'rails_helper'

describe "" do
  describe "GET /api/v1/items" do
    it "returns all items with name, description, image url but not created at or updataed at" do
      20.times do |i|
        Item.create!(name: "item#{i}",
              description: "description#{i}",
                image_url: "image_url#{i}")
      end
      #create some objects to have the endpoint return form the database
      get "/api/v1/items", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200
      #
      # ?????? = JSON.parse(response.body)
      # asssert something
    end
  end
end
