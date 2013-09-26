FactoryGirl.define do
  factory :building do
    sequence(:street_address) { |n| "#{n} Main Street"}
    city 'Boston'
    state 'MA'
    postal_code '02116'
    description 'Awesome building'
  end
end

FactoryGirl.define do
  factory :building_owner do
    first_name 'Joe'
    last_name 'Black'
    sequence(:email) { |n| "joe#{n}@email.com"}
    company_name 'Blacks & Joes'
  end
end

FactoryGirl.define do
  factory :tenant do
    first_name 'Joe'
    last_name 'Black'
    sequence(:email) { |n| "joe#{n}@email.com"}
    association(:building)
  end
end
