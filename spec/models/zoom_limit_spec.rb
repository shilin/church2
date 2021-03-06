require 'rails_helper'

RSpec.describe ZoomLimit, type: :model do
  it_behaves_like 'zoom_field'

  it { should validate_presence_of :limit }

  it { should validate_numericality_of(:limit).only_integer }
  it { should validate_inclusion_of(:limit).in_range(0..50) }
  it { should validate_uniqueness_of(:zoom).ignoring_case_sensitivity }
end
