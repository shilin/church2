class NewsItem < ApplicationRecord
  enum scope: ['global', 'local']

  validates :title, :body, presence: true
end
