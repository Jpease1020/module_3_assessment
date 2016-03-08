require 'rails_helper'

RSpec.describe "search returns mmore specific search items from bestbuy api", type: :feature do
  context "user searches for sennheiser headphones white" do
    scenario "it returns items from bestbuy api" do
        visit '/'

        VCR.use_cassette("product_search") do
          fill_in("q", with: 'sennheiser headphones white')
          click_on "Search"
        end

        # expect(page).to have_content("Galaxy Audio")
        # expect(page).to have_css("#search-product", :count => 15)
    end
  end
end
