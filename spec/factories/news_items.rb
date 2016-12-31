FactoryGirl.define do
  factory :news_item do
    title "MyString"
    body "MyText"
    body_preview "MyText"
    scope 1
    unpin_date "2016-12-30"
    image_url "MyString"
    preview_image_url "MyString"
    approved false
  end
end
