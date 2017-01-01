class NewsItem < ApplicationRecord
  include Zoomable

  scope :approved, -> { where(approved: true) }
  scope :newest_first, -> { order(created_at: 'DESC') }

  validates :title, :body, presence: true

  def self.limited_by_zoom(zoom)
    NewsItem.send(zoom.to_sym).limit(NewsItemLimit.get_limit(zoom))
  end
end
