require 'rails_helper'

RSpec.describe 'As a user' do
  describe "when I navigate to '/'" do
    it 'I see a search form where I can enter a search term' do
      visit '/'

      fill_in 'Search', with: 'sweet potatoes'

      click_on 'Search'

      expect(current_path).to eq("/foods")

      expect(page).to have_content("531 Results")

      expect(page).to have_css(".food", count: 10)

      within(first(".food")) do
        expect(page).to have_css(".nbd")
        expect(page).to have_css(".name")
        expect(page).to have_css(".food_group")
        expect(page).to have_css(".data_source")
        expect(page).to have_css(".manufacturer")
      end
    end
  end
end

# As a user,
# When I visit "/"
# And I fill in the search form with "sweet potatoes"
# (Note: Use the existing search form)
# And I click "Search"
# Then I should be on page "/foods"
# Then I should see a total of the number of items returned by the search. (531 for sweet potatoes)
# Then I should see a list of ten foods sorted by relevance.
#
# And for each of the foods I should see:
# - The food's NDB Number
# - The food's name
# - The food group to which the food belongs
# - The food's data source
# - The food's manufacturer
