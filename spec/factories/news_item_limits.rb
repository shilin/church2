FactoryGirl.define do
  factory :news_item_limit do
    zoom 1
    limit 1
  end

  factory :global_news_item_limit, class: NewsItemLimit do
    zoom 'global'
    limit 0
  end

  factory :local_news_item_limit, class: NewsItemLimit do
    zoom 'local'
    limit 0
  end
end
