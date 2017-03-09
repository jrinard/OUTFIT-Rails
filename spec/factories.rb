FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@epicodus.com" }
    password '123456'
  end
  factory :picture do
    title "nimbus"
    description "lots of coding"
  end
end
