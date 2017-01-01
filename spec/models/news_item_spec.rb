require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  it_behaves_like 'zoomable'

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
