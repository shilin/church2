FactoryGirl.define do
  factory :zoom_limit do
    zoom 'global'
    limit ZoomLimit::FALLBACK_ZOOM_LIMIT
  end

  factory :global_zoom_limit, class: ZoomLimit do
    zoom 'global'
    limit ZoomLimit::FALLBACK_ZOOM_LIMIT
  end

  factory :local_zoom_limit, class: ZoomLimit do
    zoom 'local'
    limit ZoomLimit::FALLBACK_ZOOM_LIMIT
  end
end
