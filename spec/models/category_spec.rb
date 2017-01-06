require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :tags }

  it { should validate_presence_of :name }
  it { should validate_presence_of :color }

  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_uniqueness_of(:color).ignoring_case_sensitivity }
end
