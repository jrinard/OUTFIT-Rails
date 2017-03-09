FactoryGirl.define do
  factory :picture  do
    title 'Casual'
    details 'details'
    image { File.new(Rails.root.join('spec', 'fixtures', 'images', 'test.jpg')) }
    user_id '1'
    end
end
