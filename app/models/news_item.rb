class NewsItem < ApplicationRecord
  enum scope: { global: 'global', local: 'local' }

  validates :title, :body, presence: true
end
