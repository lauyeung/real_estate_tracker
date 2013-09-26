require 'spec_helper'

feature 'user associates a building with an owner', %Q{
  As a real estate associate
  I want to match an owner of a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:
#
# * When recording a building, I want to optionally associate the building with its rightful owner.
# * If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'user selects an building owner' do
    email = 'test@user.com'
    FactoryGirl.create(:building_owner, email: email)
    street = '123 Main Street'
    city = 'Boston'
    state = 'MA'
    postal_code = '02116'
    description = 'Awesome building'

    prev_count = Building.count
    visit new_building_url
    fill_in 'Street address', with: street
    fill_in 'City', with: city
    select state, from: 'State'
    fill_in 'Postal code', with: postal_code
    fill_in 'Description', with: description
    select email, from: 'Building owner'

    click_button 'Record'

    expect(page).to have_content('Building recorded.')
    expect(page).to have_content('Add a New Building')
    expect(Building.count).to eql(prev_count + 1)
  end


end
