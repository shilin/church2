class Locating < ApplicationRecord
  belongs_to :location
  belongs_to :locatable, polymorphic: true

  validates :locatable_type, :locatable_id, :location_id, presence: true
  validates :location_id, uniqueness: { scope: [:locatable_type, :locatable_id] }
end
