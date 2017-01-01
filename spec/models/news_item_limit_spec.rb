require 'rails_helper'

RSpec.describe NewsItemLimit, type: :model do
  it_behaves_like 'zoomable'

  it { should validate_presence_of :limit }

  it { should validate_numericality_of(:limit).only_integer }
  it { should validate_inclusion_of(:limit).in_range(0..50) }
end
