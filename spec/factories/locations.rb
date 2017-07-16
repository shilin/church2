FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "MyLocation#{n}" }
  end
end
