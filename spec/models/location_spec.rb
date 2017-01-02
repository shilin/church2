require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_many(:locatings).dependent(:destroy) }
  it { should have_many :news_items }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
end
