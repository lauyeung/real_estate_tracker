require 'spec_helper'

feature 'user adds tenants', %Q{
  As an owner
  I want to add a tenant
  So that I can keep track of who is renting in my building
} do

# Acceptance Criteria:
#
# * I must specify a first name, last name, building they're renting in, and valid email address.
# * If the tenant information is valid, the tenant is associated with the building.
#   The information is persisted.
# * If the tenant information is invalid, an error message is supplied so the landlord can fix the entry.
#   The information is not persisted.

  scenario 'user specifies valid information' do
    first_name = 'Joe'
    last_name = 'Black'
    email = 'joe@gmail.com'
    building = FactoryGirl.create(:building, street_address: '3 Best Street')

    prev_count = Tenant.count
    visit new_tenant_url
    fill_in 'First name', with: first_name
    fill_in 'Last name', with: last_name
    fill_in 'Email', with: email
    select building.full_address, from: 'Building'

    click_button 'Add tenant'

    expect(page).to have_content('Tenant added.')
    expect(page).to have_content('Add a New Tenant')
    expect(Tenant.count).to eql(prev_count + 1)
  end


  scenario 'user does not specify valid information' do
    prev_count = Tenant.count
    visit new_tenant_url
    click_button 'Add tenant'

    expect(page).to have_content("can't be blank")
    expect(Tenant.count).to eql(prev_count)
  end

end
