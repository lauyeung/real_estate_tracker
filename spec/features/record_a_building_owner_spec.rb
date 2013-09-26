require 'spec_helper'

feature 'user records a building owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

# Acceptance Criteria:

# * I must specify a first name, last name, and email address
# * I can optionally specify a company name
# * If I do not specify the required information, I am presented with errors
# * If I specify the required information, the owner is recorded and
#   I am redirected to enter another new owner

  scenario 'user specifies valid information' do
    first_name = 'Joe'
    last_name = 'Black'
    email = 'joe@gmail.com'
    company_name = 'Blacks & Joes'

    prev_count = BuildingOwner.count
    visit new_building_owner_url
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Email', with: email
    fill_in 'Company name', with: company_name

    click_button 'Record'

    expect(page).to have_content('Building owner recorded.')
    expect(page).to have_content('Add a New Building Owner')
    expect(BuildingOwner.count).to eql(prev_count + 1)
  end


  scenario 'user does not specify valid information' do
    prev_count = BuildingOwner.count
    visit new_building_owner_url
    click_button 'Record'

    expect(page).to have_content("can't be blank")
    expect(BuildingOwner.count).to eql(prev_count)
  end

end
