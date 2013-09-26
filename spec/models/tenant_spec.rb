require 'spec_helper'

describe Tenant do
  it { should have_valid(:first_name).when('Ashley', 'Dan')}
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Bawitdaba', 'Youngless')}
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('test@email.com', 'danger@hotmail.com')}
  it { should_not have_valid(:email).when('', nil) }

  it { should have_valid(:building).when(Building.new) }
  it { should_not have_valid(:building).when(nil) }

  it { should belong_to(:building) }

  it 'sorts tenants by first and last name' do
    first_name_a = 'Alice'
    first_name_b = 'Beatrice'
    last_name_b = 'Bravo'
    last_name_a = 'Alpha'
    second_tenant = FactoryGirl.create(:tenant, first_name: first_name_b, last_name: last_name_a)
    third_tenant = FactoryGirl.create(:tenant, first_name: first_name_a, last_name: last_name_b)
    first_tenant = FactoryGirl.create(:tenant, first_name: first_name_a, last_name: last_name_a)

    expect(Tenant.sorted[0].id).to eql(first_tenant.id)
    expect(Tenant.sorted[1].id).to eql(second_tenant.id)
    expect(Tenant.sorted[2].id).to eql(third_tenant.id)
  end
end
