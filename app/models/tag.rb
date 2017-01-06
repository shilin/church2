class Tag < ApplicationRecord
  belongs_to :category

  has_many :taggings, dependent: :destroy

  has_many :news_items,
           through: :taggings,
           source: :taggable,
           source_type: 'NewsItem'

  validates :name, :category_id, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
