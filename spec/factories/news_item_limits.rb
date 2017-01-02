FactoryGirl.define do
  factory :zoom_limit do
    zoom 1
    limit 1
  end

  factory :global_zoom_limit, class: ZoomLimit do
    zoom 'global'
    limit 0
  end

  factory :local_zoom_limit, class: ZoomLimit do
    zoom 'local'
    limit 0
  end
end
