class NewsItem < ApplicationRecord
  include Zoomable

  scope :approved, -> { where(approved: true) }

  validates :title, :body, presence: true
end
