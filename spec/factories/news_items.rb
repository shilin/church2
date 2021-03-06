FactoryGirl.define do
  sequence :title do |n|
    "MyTitle#{n}"
  end

  sequence :body do |n|
    "MyBody#{n}"
  end

  sequence :body_preview do |n|
    "MyBodyPreview#{n}"
  end

  factory :news_item do
    title
    body
    body_preview
    unpin_date '2016-12-30'
    image_url 'MyImageUrl'
    preview_image_url 'MyPreviewImageUrl'
    approved true
  end

  factory :global_news_item, class: NewsItem do
    title
    body
    body_preview
    zoom 'global'
    unpin_date '2016-12-30'
    image_url 'MyImageUrl'
    preview_image_url 'MyPreviewImageUrl'
    approved true
  end

  factory :local_news_item, class: NewsItem do
    title
    body
    body_preview
    zoom 'local'
    unpin_date '2016-12-30'
    image_url 'MyImageUrl'
    preview_image_url 'MyPreviewImageUrl'
    approved true
  end
end
