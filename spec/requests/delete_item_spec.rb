require 'rails_helper'

describe "delete request to api/v1/item/:id returns an item serialized" do
  describe "DELETE /api/v1/items/:id" do
    it "delets an item with the id sent in the params" do
      20.times do |i|
        Item.create!(name: "item#{i}",
              description: "description#{i}",
                image_url: "image_url#{i}")
      end

      delete "/api/v1/items/1", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 204

      refute Item.find_by(id: 1)

      delete "/api/v1/items/16", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 204

      refute Item.find_by(id: 16)
    end
  end
end
