FactoryGirl.define do
  sequence :number do |n|
    "8-999-1234-56-7#{n}"
  end

  sequence :description do |n|
    "MyPhoneDescription#{n}"
  end

  factory :phone do
    description
    for_public false
    phone_type 'landline'
    number '8-999-1234-56-00'
  end

  factory :landline_phone, class: Phone do
    description
    for_public true
    phone_type 'landline'
    number
  end

  factory :mobile_phone, class: Phone do
    description
    for_public true
    phone_type 'mobile'
    number
  end

  factory :fax_phone, class: Phone do
    description
    for_public true
    phone_type 'fax'
    number
  end
end
