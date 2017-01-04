class Addressing < ApplicationRecord
  belongs_to :addressable, polymorphic: true
  belongs_to :address

  validates :addressable_type, :addressable_id, :address_id, presence: true
  validates :address_id, uniqueness: { scope: [:addressable_type, :addressable_id] }
end
