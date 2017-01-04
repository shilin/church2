require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should have_many(:addressings).dependent(:destroy) }
  it { should have_many :congregations }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_presence_of(:body) }
end
