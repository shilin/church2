require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_many(:taggings).dependent(:destroy) }
  it { should have_many(:news_items) }

  it { should belong_to :category }
  it { should validate_presence_of :category_id }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
