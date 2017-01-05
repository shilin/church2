class Phoning < ApplicationRecord
  belongs_to :phonable, polymorphic: true
  belongs_to :phone

  validates :phone_id, :phonable_type, :phonable_id, presence: true
  validates :phone_id, uniqueness: { scope: [:phonable_type, :phonable_id] }
end
