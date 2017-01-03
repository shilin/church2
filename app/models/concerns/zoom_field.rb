module ZoomField
  extend ActiveSupport::Concern

  ZOOMS = [:global, :local].freeze

  included do
    enum zoom: ZOOMS
    validates :zoom, presence: true
  end
end
