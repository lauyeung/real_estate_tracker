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
end
