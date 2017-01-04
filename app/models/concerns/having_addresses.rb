module HavingAddresses
  extend ActiveSupport::Concern

  included do
    has_many :addressings, as: :addressable, dependent: :destroy
    has_many :addresses, through: :addressings
  end
end
