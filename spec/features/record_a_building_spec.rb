require 'spec_helper'

feature 'user records a building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format,
#   the building is recorded.
# * If I do not specify all of the required information in the required formats,
#   the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected so that I can record another building.

  scenario 'user specifies valid information' do
    street = '123 Main Street'
    city = 'Boston'
    state = 'MA'
    postal_code = '02116'
    description = 'Awesome building'

    prev_count = Building.count
    visit new_building_path
    fill_in 'Street address', with: street
    fill_in 'City', with: city
    select state, from: 'State'
    fill_in 'Postal code', with: postal_code
    fill_in 'Description', with: description

    expect(page).to have_content('Building recorded.')
    expect(Building.count).to eql(prev_count + 1)
  end


  scenario 'user does not specify valid information'


end
