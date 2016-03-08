require 'rails_helper'

RSpec.describe "search returns items from bestbuy api", type: :feature do
  context "user searches for sennheiser" do
    scenario "it returns items from bestbuy api" do
        visit '/'

        within('search') do
          fill_in("search", with: 'sennheiser')
          click_on "submit"
          expect(page)to have_content?("")
        end
    end
  end
end
