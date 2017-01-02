class NewsItem < ApplicationRecord
  include Zoomable

  scope :approved, -> { where(approved: true) }
  scope :newest_first, -> { order(created_at: 'DESC') }

  scope :global_limit, -> { limit(ZoomLimit.limit(:global)) }
  scope :local_limit, -> { limit(ZoomLimit.limit(:local)) }

  scope :global_list, -> { approved.global.global_limit.newest_first }
  scope :local_list, -> { approved.local.local_limit.newest_first }

  validates :title, :body, presence: true
end
