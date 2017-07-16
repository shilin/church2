require 'rails_helper'

RSpec.describe Qna, type: :model do
  it_behaves_like 'taggable'

  it { should validate_presence_of :name }
  it { should validate_presence_of :question }

  it do
    should validate_length_of(:question)
      .is_at_least(Qna::MIN_QUESTION_LENGTH)
      .is_at_most(Qna::MAX_QUESTION_LENGTH)
  end
end
