module Zoomable
  extend ActiveSupport::Concern

  ZOOMS = [:global, :local].freeze
  FALLBACK_ZOOM_LIMIT = 3

  included do
    enum zoom: ZOOMS
    validates :zoom, presence: true
  end
end
