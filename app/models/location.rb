class Location < ApplicationRecord
  has_many :locatings, dependent: :destroy

  has_many :news_items,
           through: :locatings,
           source: :locatable,
           source_type: 'NewsItem'

  has_many :congregations,
           through: :locatings,
           source: :locatable,
           source_type: 'Congregation'

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
