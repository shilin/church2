class Phone < ApplicationRecord
  PHONE_TYPES = [:landline, :mobile, :fax].freeze

  enum phone_type: PHONE_TYPES

  has_many :phonings, dependent: :destroy

  has_many :congregations,
           through: :phonings,
           source: :phonable,
           source_type: 'Congregation'

  has_many :clergymen,
           through: :phonings,
           source: :phonable,
           source_type: 'Clergyman'

  validates :description, :number, presence: true
  validates :description, uniqueness: true

  scope :for_public, -> { where(for_public: true) }
end
