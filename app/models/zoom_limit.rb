class ZoomLimit < ApplicationRecord
  include Zoomable

  validates :limit, presence: true
  validates :limit, numericality: { only_integer: true }
  validates :limit, inclusion: { in: (0..50) }

  validates :zoom, uniqueness: { case_sensitive: false }

  def self.limit(zoom)
    find_by(zoom: zoom).try(:limit) || FALLBACK_ZOOM_LIMIT
  end
end
