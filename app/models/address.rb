class Address < ApplicationRecord
  has_many :addressings, dependent: :destroy
  has_many :congregations,
           through: :addressings,
           source: :addressable,
           source_type: 'Congregation'

  validates :name, :body, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  scope :geo, -> { where(geo: true) }
  scope :postal, -> { where(postal: true) }
end
