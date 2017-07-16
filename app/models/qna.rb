class Qna < ApplicationRecord
  MIN_QUESTION_LENGTH = 6
  MAX_QUESTION_LENGTH = 4000

  include Taggable

  scope :approved, -> { where(approved: true) }

  validates :question, presence: true,
                       length: { minimum: MIN_QUESTION_LENGTH,
                                 maximum: MAX_QUESTION_LENGTH }
  validates :name, presence: true
end
