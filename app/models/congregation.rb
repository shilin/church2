class Congregation < ApplicationRecord
  validates :name, presence: true
  scope :ordered_by_name, -> { order(name: 'DESC') }
end
