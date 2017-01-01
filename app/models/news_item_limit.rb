class NewsItemLimit < ApplicationRecord
  include Zoomable

  validates :limit, presence: true
  validates :limit, numericality: { only_integer: true }
  validates :limit, inclusion: { in: (0..50) }
end
