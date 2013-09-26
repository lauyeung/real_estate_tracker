require 'spec_helper'

describe Building do
  it { should have_valid(:street_address).when('1 Main St', '33 Harrison Ave')}
  it { should_not have_valid(:street_address).when('', nil) }

  it { should have_valid(:city).when('Boston', 'Cambridge')}
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('MA', 'CA', 'NY')}
  it { should_not have_valid(:state).when('', nil, 'random') }

  it { should have_valid(:postal_code).when('02111', '02139', '90210')}
  it { should_not have_valid(:postal_code).when('', nil) }

end
