FactoryGirl.define do
  factory :congregation do
    sequence :name do |n|
      "MyCongregationName#{n}"
    end
    about 'MyAbout'
    schedule 'MySchedule'
  end
end
