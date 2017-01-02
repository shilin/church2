FactoryGirl.define do
  sequence :name do |n|
    "MyLocation#{n}"
  end
  factory :location do
    name
  end
end
