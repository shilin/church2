require 'rails_helper'

RSpec.describe Tagging, type: :model do
  it { should belong_to :taggable }
  it { should belong_to :tag }

  before do
    tag = create(:tag, category: create(:category))
    create(:tagging, taggable: create(:news_item), tag: tag)
  end

  it do
    should validate_uniqueness_of(:tag_id).scoped_to([:taggable_type, :taggable_id])
  end
end
