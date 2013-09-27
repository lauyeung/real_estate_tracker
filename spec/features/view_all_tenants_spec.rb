require 'spec_helper'

feature 'user adds tenants', %Q{
  As an owner
  I want to view all of my tenants
  So that I can have a roster of those renting in my building
} do

# Acceptance Criteria:
#
# * There is a page that lists all of my tenants sorted by last name and first name.
# * I can see where each tenant lives and what their email address is.

  scenario 'alphabetized list of tenants' do
    last_name_b = 'Bravo'
    last_name_a = 'Alpha'
    FactoryGirl.create(:tenant, last_name: last_name_b)
    FactoryGirl.create(:tenant, last_name: last_name_a)

    visit tenants_url

    expect(page).to have_content(last_name_a)
    expect(page).to have_content(last_name_b)
  end

end




