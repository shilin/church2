module Locatable
  extend ActiveSupport::Concern

  included do
    has_many :locatings, as: :locatable, dependent: :destroy
    has_many :locations, through: :locatings
  end
end
