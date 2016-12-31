class NewsItem < ApplicationRecord
  enum scope: ['global', 'local']

  scope :approved, -> { where(approved: true) }

  validates :title, :body, presence: true
end
