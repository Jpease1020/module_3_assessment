require 'rails_helper'

RSpec.describe "root page displays items", type: :feature do
  context "visit root path" do
    scenario "it reaches the homepage" do
        visit '/'
        assert_equal 200, page.status_code

        within('h1') do
          assert page.has_content?('Items'), "page should have an Items heading"
        end
    end
  end
end
