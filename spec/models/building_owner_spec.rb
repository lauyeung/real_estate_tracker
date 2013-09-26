require 'spec_helper'

describe BuildingOwner do
  it { should have_valid(:first_name).when('Ashley', 'Dan')}
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Bawitdaba', 'Youngless')}
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:email).when('test@email.com', 'danger@hotmail.com')}
  it { should_not have_valid(:email).when('', nil) }
end
