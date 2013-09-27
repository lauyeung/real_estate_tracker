require 'spec_helper'

feature 'user evicts tenants', %Q{
  As a landlord
  I want to evict tenants
  So that they're no longer associated with a building I own
} do

# Acceptance Criteria:
#
# * When viewing my roster of tenants, I want an option to evict each tenant.
# * When I opt to evict a tenant, the tenant is removed from my roster and is
#   no longer associated with the building.

  scenario 'removes tenant' do
    FactoryGirl.create(:tenant)

    visit tenants_url

    click_link 'Evict'
    expect(page).to have_content('Tenant evicted.')
  end

end




