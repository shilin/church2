class Category < ApplicationRecord
  has_many :tags

  validates :name, :color, uniqueness: { case_sensitive: false }
  validates :name, :color, presence: true
end
