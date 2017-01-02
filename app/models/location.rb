class Location < ApplicationRecord
  has_many :locatings, dependent: :destroy
  has_many :news_items,
           through: :locatings,
           source: :locatable,
           source_type: 'NewsItem'

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
