require 'rails_helper'

RSpec.describe "search returns items from bestbuy api", type: :feature do
  context "user searches for sennheiser" do
    scenario "it returns items from bestbuy api" do
        visit '/'
        VCR.use_cassette("product_search") do
        # within('search') do
          fill_in("q", with: 'sennheiser')
          click_on "Search"
        end
        expect(page).to have_content("Galaxy Audio")
    end
  end
end
