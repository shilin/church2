module Zoomable
  extend ActiveSupport::Concern

  ZOOMS = [:global, :local].freeze
  FALLBACK_ZOOM_LIMIT = 3

  included do
    enum zoom: ZOOMS
    validates :zoom, presence: true
  end

  def self.global_limit
    NewsItemLimit.find_by(zoom: 'global').try(:first).try(:limit) || FALLBACK_ZOOM_LIMIT
  end

  def self.local_limit
    NewsItemLimit.find_by(zoom: 'local').try(:first).try(:limit) || FALLBACK_ZOOM_LIMIT
  end
end
