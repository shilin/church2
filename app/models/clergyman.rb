class Clergyman < ApplicationRecord
  include Phonable

  enum rank: [:deacon, :pastor, :bishop]

  validates :first_name, :last_name, :rank, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
