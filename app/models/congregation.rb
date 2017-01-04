class Congregation < ApplicationRecord
  include HavingAddresses

  has_one :locating, as: :locatable, dependent: :destroy
  has_one :location, through: :locating

  validates :name, presence: true

  scope :ordered_by_name, -> { order(name: 'DESC') }
end
