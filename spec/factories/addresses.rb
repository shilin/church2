FactoryGirl.define do
  factory :address do
    name 'MyAddressName'
    body 'MyAddressBody'
    postal false
    geo false
  end

  factory :geo_address, class: Address do
    name 'MyGeoAddressName'
    body 'MyGeoAddressBody'
    postal false
    geo true
  end

  factory :postal_address, class: Address do
    name 'MyPostalAddressName'
    body 'MyPostalAddressBody'
    postal true
    geo false
  end
end
