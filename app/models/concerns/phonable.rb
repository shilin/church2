module Phonable
  extend ActiveSupport::Concern

  included do
    has_many :phonings, as: :phonable, dependent: :destroy
    has_many :phones, through: :phonings
  end
end
